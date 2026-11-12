-- svelte-language-server: don't ask the client to watch files (merged into lspconfig's defaults)
vim.lsp.config('svelte', {
  capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = false } } },
})
