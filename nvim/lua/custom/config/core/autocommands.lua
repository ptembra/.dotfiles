local function augroup(name)
	return vim.api.nvim_create_augroup("pedro_" .. name, { clear = true })
end

-- Highlight on yank (From Lazyvim config)
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		-- "notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("ruby_autocomplete"),
	pattern = {
		"ruby",
		"eruby"
	},
	callback = function()
		vim.g.rubycomplete_buffer_loading = 1
		vim.g.rubycomplete_classes_in_global = 1
	end
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup("format_on_save"),
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})
