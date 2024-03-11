require("nvim-treesitter.configs").setup({
	highlight = {
		enabled = true
	},
	ensure_installed={
		"css",
		"typescript",
		"tsx",
		"ruby",
		"lua"
	},
})
