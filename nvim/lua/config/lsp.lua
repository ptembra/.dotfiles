local svelte_lsp_capabilities = vim.tbl_deep_extend("force", {}, capabilities)
svelte_lsp_capabilities.workspace = { didChangeWatchedFiles = false }
lspconfig.svelte.setup({
  capabilities = svelte_lsp_capabilities,
  filetypes = { "svelte" },
})
