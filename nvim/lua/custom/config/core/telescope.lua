require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true
		}
	},
	defaults = {
		-- mappings = {
		-- 	n = {
		-- 		[":q<cr>"] = require("telescope.actions").delete_buffer,
		-- 	},
		-- },
	},
	extensions = {
		fzf = {
			fuzzy = true,                -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "ignore_case",   -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		['ui-select'] = {
			require('telescope.themes').get_dropdown(),
		},
	}
})

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
