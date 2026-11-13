-- php_template_indent.lua — indentexpr for PHP files that mix PHP and HTML.
-- HTML lines: tag/bracket counting + PHP alternative-syntax blocks (if:/endif etc.).
-- PHP lines inside <?php ... ?>: indent of the opening <?php line + tree-sitter nesting depth.
-- shortcut: multi-line HTML attributes, heredocs and "?>" inside PHP strings aren't handled; fix if they bite.
local M = {}

local VOID = {}
for t in ([[area base br col embed hr img input link meta param source track wbr]]):gmatch('%S+') do VOID[t] = true end
local NOINDENT = { html = true } -- match js-beautify/intelephense: head/body not indented under html

local PHP_NEST = {}
for t in ([[compound_statement declaration_list enum_declaration_list array_creation_expression
  arguments formal_parameters parenthesized_expression switch_block match_block case_statement
  default_statement colon_block property_hook_list]]):gmatch('%S+') do PHP_NEST[t] = true end

local ALT_OPEN = { ['if'] = true, ['elseif'] = true, ['else'] = true, ['foreach'] = true,
  ['for'] = true, ['while'] = true, ['switch'] = true }
local ALT_CLOSE = { endif = true, endforeach = true, endfor = true, endwhile = true, endswitch = true,
  ['else'] = true, ['elseif'] = true }

local function getline(l) return vim.fn.getline(l) end

-- Split a template line into html text (php segments removed) and the list of php segments.
local function split(s)
  local html, segs, i = {}, {}, 1
  while true do
    local a = s:find('<%?', i)
    if not a then html[#html + 1] = s:sub(i); break end
    html[#html + 1] = s:sub(i, a - 1)
    local b = s:find('%?>', a + 2)
    if not b then segs[#segs + 1] = s:sub(a); break end
    segs[#segs + 1] = s:sub(a, b + 1)
    i = b + 2
  end
  return table.concat(html, ' '), segs
end

local function php_word(seg) -- first keyword in "<?php kw ..." / "<? kw"
  local body = seg:gsub('^<%?php', ''):gsub('^<%?=?', '')
  return body:match('^%s*([%a_]+)') or body:match('^%s*([{}])')
end

local function alt_delta(seg)
  local w = php_word(seg)
  local d = 0
  if w and ALT_CLOSE[w] or w == '}' then d = d - 1 end
  local body = seg:gsub('%?>$', '')
  if (w and ALT_OPEN[w] and body:match(':%s*$')) or body:match('{%s*$') then d = d + 1 end
  return d
end

-- net indent change contributed by a template line
local function net(s)
  local html, segs = split(s)
  local n = 0
  html = html:gsub('<!%-%-.-%-%->', ''):gsub('"[^"]*"', '""'):gsub("'[^']*'", "''")
  for close, tag, rest in html:gmatch('<(/?)([%a][%w:%-]*)([^>]*)>') do
    tag = tag:lower()
    if not VOID[tag] and not NOINDENT[tag] and not rest:match('/%s*$') then
      n = n + (close == '/' and -1 or 1)
    end
  end
  for c in html:gmatch('[%[%]{}()]') do n = n + (('[{('):find(c, 1, true) and 1 or -1) end
  for _, seg in ipairs(segs) do n = n + alt_delta(seg) end
  return n
end

-- 1 if the line starts with something that closes a level
local function lead(s)
  s = s:match('^%s*(.*)$')
  if s:match('^</') or s:match('^[}%])]') then return 1 end
  if s:match('^<%?') then
    local w = php_word(s:match('^<%?[^?]*') or s)
    if w and ALT_CLOSE[w] or w == '}' then return 1 end
  end
  return 0
end

-- Is line `lnum` inside a <?php block? Returns the line number of the opening tag or nil.
local function php_opener(lnum)
  for i = lnum - 1, math.max(1, lnum - 2000), -1 do
    local s = getline(i)
    local last_open, last_close, pos = nil, nil, 1
    while true do
      local a = s:find('<%?', pos)
      local b = s:find('%?>', pos)
      if not a and not b then break end
      if a and (not b or a < b) then last_open = a; pos = a + 2 else last_close = b; pos = b + 2 end
    end
    if last_open and (not last_close or last_open > last_close) then return i end
    if last_close then return nil end
  end
  return nil
end

local function php_depth(lnum, col, opener)
  local ok, parser = pcall(vim.treesitter.get_parser, 0, 'php', { error = false })
  if not ok or not parser then return nil end
  parser:parse()
  local tree = parser:trees()[1]
  if not tree then return nil end
  local r = lnum - 1
  local node = tree:root():named_descendant_for_range(r, col, r, col)
  local depth = 0
  -- while typing, the tree is usually broken (unclosed braces): let the caller fall back
  local n = node
  while n do
    if n:type() == 'ERROR' or n:missing() then return nil end
    n = n:parent()
    if n and n:type() == 'program' then break end
  end
  local rows = {} -- count at most one level per starting row: `foo(function () {` is one level
  while node do
    local sr = node:start()
    if PHP_NEST[node:type()] and sr < r and sr >= opener - 1 and not rows[sr] then
      rows[sr] = true
      depth = depth + 1
    end
    node = node:parent()
  end
  return depth
end

function M.indent(lnum)
  lnum = lnum or vim.v.lnum
  local sw = vim.fn.shiftwidth()
  local line = getline(lnum)
  local text = line:match('^%s*(.-)%s*$')
  local opener = php_opener(lnum)

  -- PHP code line inside a multi-line <?php block
  if opener and not text:match('^<%?') then
    local base = vim.fn.indent(opener)
    if text:match('^%?>') then return base end
    local p = vim.fn.prevnonblank(lnum - 1)
    if p == opener then
      if text == '' then return base end
    end
    if text ~= '' and not vim.b.php_template_indent_no_ts then
      local d = php_depth(lnum, #line - #line:gsub('^%s+', ''), opener)
      if d then
        if text:match('^[}%])]') then d = d - 1 end
        if text:match('^%??%->') then d = d + 1 end
        return base + sw * math.max(d, 0)
      end
    end
    -- blank line / no parser: smartindent-like
    if p == opener then return base end
    local closer = text:match('^([}%])])')
    if closer then -- align with the line holding the matching opener
      local open = ({ ['}'] = '{', [')'] = '(', [']'] = '\\[' })[closer]
      local save = vim.api.nvim_win_get_cursor(0)
      local c0 = #line - #line:gsub('^%s+', '')
      vim.api.nvim_win_set_cursor(0, { lnum, c0 })
      local m = vim.fn.searchpairpos(open, '', closer == ']' and '\\]' or closer, 'bnW')[1]
      vim.api.nvim_win_set_cursor(0, save)
      if m > 0 and m >= opener then return vim.fn.indent(m) end
    end
    local ps = getline(p)
    local ind = vim.fn.indent(p)
    if ps:match('[{(%[]%s*$') or ps:match(':%s*$') then ind = ind + sw end
    if text:match('^[}%])]') then ind = ind - sw end
    if (text:match('^case%s') or text:match('^default%s*:')) and not ps:match('{%s*$')
      and not ps:match('^%s*case%s') and not ps:match('^%s*default%s*:') then ind = ind - sw end
    return math.max(ind, base)
  end

  -- Template (HTML) line, or a line that starts with <?
  local p = vim.fn.prevnonblank(lnum - 1)
  if p == 0 then return 0 end
  local ps = getline(p)
  local ref = p
  local popener = php_opener(p + 1) -- was the end of line p inside php?
  if popener or ps:match('^%s*%?>') then
    -- previous line was PHP code / ?>: step back to the <?php line that opened that block
    ref = popener or php_opener(p) or p
  end
  local rs = getline(ref)
  local ind = vim.fn.indent(ref) + sw * (net(rs) + lead(rs) - lead(line))
  return math.max(ind, 0)
end

function M.setup(buf)
  buf = buf or 0
  vim.bo[buf].indentexpr = "v:lua.require'php_template_indent'.indent()"
  vim.bo[buf].indentkeys = '0{,0},0),0],!^F,o,O,e,*<Return>,>,;,:,=?>,=<?'
  vim.bo[buf].autoindent = true
  vim.bo[buf].smartindent = false
  vim.bo[buf].cindent = false
end

return M
