-- Leader must be set before plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1 -- oil replaces netrw
vim.g.loaded_netrwPlugin = 1
vim.g.have_nerd_font = true

-- [[ Options ]]
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd.set('nohidden')
vim.opt.mouse = 'a'
vim.opt.showmode = false -- lualine shows it

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- vim.opt.clipboard = 'unnamedplus' -- uncomment to share the system clipboard
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true -- case-insensitive search unless the term has capitals
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300 -- which-key pops up sooner
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split' -- live preview of :s
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

vim.opt.rtp:prepend('/opt/homebrew/opt/fzf/')

-- [[ Keymaps ]]
-- Split navigation (tmux uses Option-hjkl for panes, so these reach nvim)
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Diagnostics ]]
vim.diagnostic.config({
  virtual_text = {
    source = true,
    prefix = '●',
    format = function(diag)
      return string.format("%s: %s", diag.source, diag.message)
    end,
    update_in_insert = false,
  }
})

-- [[ lazy.nvim ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    assert(require 'plugins.init'),
  },
  install = {
    colorscheme = { "everforest" }
  },
})

require('config.init')
