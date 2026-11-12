-- Reload buffers as soon as another program (pi, git, a formatter) changes the file on disk.
-- Watches each open file's directory rather than the file, so atomic "write temp + rename" saves are caught too.
-- Buffers with unsaved edits aren't overwritten; nvim asks what to do instead.
local watchers = {} -- dir -> uv fs_event handle

local function check(dir)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf)
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" and vim.fs.dirname(name) == dir then
      vim.cmd.checktime(buf)
    end
  end
end

local function watch(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  if name == "" or vim.bo[buf].buftype ~= "" then return end
  local dir = vim.fs.dirname(name)
  if watchers[dir] or vim.fn.isdirectory(dir) == 0 then return end
  local handle = vim.uv.new_fs_event()
  if not handle then return end
  local pending = false
  handle:start(dir, {}, function()
    if pending then return end -- one check per burst of writes
    pending = true
    vim.defer_fn(function()
      pending = false
      if vim.fn.mode() ~= "c" then check(dir) end
    end, 100)
  end)
  watchers[dir] = handle
end

local group = vim.api.nvim_create_augroup("pedro_autoreload", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = group,
  callback = function(ev) watch(ev.buf) end,
})
-- fallback for anything the watcher misses
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = group,
  command = "silent! checktime",
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = group,
  callback = function(ev)
    vim.notify("Reloaded " .. vim.fn.fnamemodify(ev.file, ":~:."), vim.log.levels.INFO)
  end,
})
