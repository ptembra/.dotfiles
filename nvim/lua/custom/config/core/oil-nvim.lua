require("oil").setup()
require("oil").toggle_hidden()

require('which-key').add(
	{
		{ "<leader>o", "<cmd>Oil<CR>", desc = "Open parent directory", nowait = true, remap = false },
	}
)

require("which-key").add(
	{
		"<leader>h",
		function()
			if vim.bo.filetype == "oil" then
				require("oil").toggle_hidden()
			end
		end,
		mode = "n",
		noremap = true,
		nowait = true,
		silent = true,
		hidden = true
	}
)
