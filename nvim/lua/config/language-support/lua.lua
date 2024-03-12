require("lspconfig").lua_ls.setup(
	{
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace"
				},
				diagnostics = {
					globals = { "vim" }
				}
			}
		}
	}
)
