-- Every tool Mason manages. Missing ones install in the background on startup (e.g. on a new Mac).
-- Removing a name here doesn't uninstall it; use :Mason for that.
local tools = {
  -- language servers
  "clangd", "elixir-ls", "emmet-language-server", "eslint-lsp", "gopls", "html-lsp",
  "intelephense", "lua-language-server", "matlab-language-server", "pyright", "ruff",
  "rust-analyzer", "svelte-language-server", "tailwindcss-language-server", "templ",
  "typescript-language-server", "vim-language-server", "zls",
  -- formatters (run by conform.nvim)
  "goimports", "prettier", "stylua",
}

return {
  "mason-org/mason.nvim",
  opts = {
    ui = {
      icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    local registry = require("mason-registry")
    registry.refresh(function()
      for _, name in ipairs(tools) do
        local ok, pkg = pcall(registry.get_package, name)
        if not ok then
          vim.notify("mason: unknown package " .. name, vim.log.levels.WARN)
        elseif not pkg:is_installed() then
          vim.notify("mason: installing " .. name)
          pkg:install()
        end
      end
    end)
  end,
}
