local util = require("lspconfig.util")
require("lspconfig").solargraph.setup({
	settings = {
		Solargraph = {
			cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", 'stdio' },
			root_dir = util.root_pattern("Gemfile", ".git")(fname) or
				util.path.dirname(vim.api.nvim_buf_get_name(0)),
		}
	}
})
