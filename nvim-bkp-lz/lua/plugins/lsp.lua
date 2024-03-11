return {
  -- Change LSP Config for Neodev
  {
    "neovim/nvim-lspconfig",
    opts = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
      },
    },
    init = function()
      require("lspconfig").lua_ls.setup({})
    end,
  },
}
