require("nvim-treesitter.configs").setup({
	highlight = {
		enabled = true
	},
	ensure_installed={
		"css",
		"typescript",
		"tsx",
		"ruby",
		"lua",
		"javascript"
	},
	auto_install = true,
	sync_install = false,
	modules = {
		-- Modules here
	},
	ignore_install = {},
})
