-- Map leader key
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

plugins = require("plugins")

vim.lsp.set_log_level("debug")
-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)

require("config")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 0

-- LSP
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.backup = false
vim.o.writebackup = false

-- W-K Delay
vim.o.timeoutlen = 300
vim.o.timeout = true
vim.o.ttimeoutlen = 300

-- Generic Configs
vim.o.number = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.scrolloff = 10
vim.o.showmode = true
vim.o.termguicolors = true
vim.o.winblend = 10
vim.o.pumblend = 10
vim.o.relativenumber = true

-- NeoDev
require("neodev").setup()

-- LSP Configs
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace"
			}
		}
	}
})
