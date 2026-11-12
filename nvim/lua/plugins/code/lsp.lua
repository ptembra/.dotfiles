-- Enables every Mason-installed language server (tool list: mason.lua)
return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
}
