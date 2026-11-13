-- svelte-language-server: don't ask the client to watch files (merged into lspconfig's defaults)
vim.lsp.config('svelte', {
  capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = false } } },
})

-- emmet's defaults skip php; add it (and blade) so html boilerplate expands in templates
vim.lsp.config('emmet_language_server', {
  filetypes = {
    'astro', 'css', 'eruby', 'html', 'htmlangular', 'htmldjango', 'javascriptreact',
    'less', 'php', 'blade', 'sass', 'scss', 'svelte', 'typescriptreact', 'vue',
  },
  init_options = { includeLanguages = { php = 'html', blade = 'html' } },
})
