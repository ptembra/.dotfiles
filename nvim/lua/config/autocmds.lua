local function augroup(name)
  return vim.api.nvim_create_augroup("pedro_" .. name, { clear = true })
end

-- Highlight on yank (From Lazyvim config)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Allow closing select windows with 'q'
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    -- "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Format on save: see plugins/code/conform.lua

-- -- Start vim inside oil by default
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     if vim.fn.argc() == 0 then
--       vim.schedule(function()
--         require("oil").open(vim.fn.getcwd())
--       end)
--     end
--   end,
-- })
