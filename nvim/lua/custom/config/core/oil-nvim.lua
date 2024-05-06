require("oil").setup()

require("which-key").register({
		["o"] = {
			"<cmd>Oil<CR>", "Open parent directory"
		}
	},
	{
		mode = 'n',
		prefix = '<leader>',
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}
)
