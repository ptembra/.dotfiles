require("lspconfig").lua_ls.setup(
	{
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace"
				},
				codeLens = {
					enable = true,
				},
				diagnostics = {
					globals = { "vim" }
				}
			}
		}
	}
)
