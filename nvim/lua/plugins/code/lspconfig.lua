local lazy_support = require("utils.lazy_support")

return {
	{
		"https://github.com/neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
			{ 'folke/neodev.nvim',  opts = {} },
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},
			{ "hrsh7th/vim-vsnip", lazy = false, dependencies = { "hrsh7th/vim-vsnip-integ" } }
		},
		opts = {
			inlay_hints = {
				enabled = false,
			},
			codelens = {
				enabled = false,
			},
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
		},
		config = function(_, opts)
			if lazy_support.plug_loaded("neoconf.nvim") then
				local plug = lazy_support.get_plug("neoconf.nvim")
				require("neoconf").setup(require("lazy.core.plugin").values(plug, "opts", false))
			end
		end
	},
}
