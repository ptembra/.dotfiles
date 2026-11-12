-- Formatting. Filetypes not listed fall back to their language server
-- (rust-analyzer/rustfmt, clangd, elixir-ls/mix format, intelephense, zls, gopls).
-- Linting comes from language servers: ruff, eslint-lsp, lua_ls, gopls, clangd.
local web = { "prettier" }

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      python = { "ruff_organize_imports", "ruff_format" },
      lua = { "stylua" },
      go = { "goimports" },
      javascript = web,
      typescript = web,
      javascriptreact = web,
      typescriptreact = web,
      svelte = web,
      css = web,
      html = web,
      json = web,
      yaml = web,
      markdown = web,
    },
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = { timeout_ms = 1000 },
  },
}
