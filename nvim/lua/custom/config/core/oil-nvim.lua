require("oil").setup()
require("oil").toggle_hidden()

require("which-key").register({
		["o"] = {
			"<cmd>Oil<CR>", "Open parent directory",
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

require("which-key").register({
	["h"] = {
		function()
			if vim.bo.filetype == "oil" then
				require("oil").toggle_hidden()
			end
		end, "which_key_ignore"
	}
}, {
	mode = 'n',
	prefix = '<leader>',
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
})
