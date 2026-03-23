return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			sync_install = true,
			ignore_install = {},
			auto_install = false,
			modules = {},
			ensure_installed = {
				"svelte",
				"html",
				"css",
				"javascript",
				"typescript",
			},
			highlight = {
				enable = {},
			},
		})
	end,
}
