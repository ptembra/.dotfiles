-- nvim-treesitter `main` branch (master doesn't support Neovim 0.12). Needs `tree-sitter-cli` from Homebrew.
-- It only installs parsers; highlighting is Neovim's own vim.treesitter.start().
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- doesn't support lazy-loading
	build = ":TSUpdate",
	config = function()
		-- no-op for parsers that are already installed
		require("nvim-treesitter").install({
			"bash", "c", "cpp", "css", "eex", "elixir", "go", "heex", "html", "java",
			"javascript", "json", "lua", "markdown", "markdown_inline", "python", "rust",
			"svelte", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
		})
		-- highlight any filetype that has a parser; pcall skips the rest
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("pedro_treesitter", { clear = true }),
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
			end,
		})
	end,
}
