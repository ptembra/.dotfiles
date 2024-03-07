require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true
		}
	},
	defaults = {
		mappings = {
			n = {
				[":q<cr>"] = require("telescope.actions").delete_buffer,
			},
		},
	}
})
