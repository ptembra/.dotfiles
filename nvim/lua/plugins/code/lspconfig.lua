return {
	{
		"https://github.com/neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ 'folke/neodev.nvim', opts = {} }
		},
	},
	{ "hrsh7th/vim-vsnip", lazy = false, dependencies = { "hrsh7th/vim-vsnip-integ" } }
}
