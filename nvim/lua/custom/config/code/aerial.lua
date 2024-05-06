require("aerial").setup()

require("which-key").register(
	{
		["a"] = { "<cmd>AerialToggle!<CR>", "Toggle Aerial" },
		-- ["{"] = { "<cmd>AerialPrev<CR>", "Previous Symbol" },
		-- ["}"] = { "<cmd>AerialNext<CR>", "Next Symbol" },
	}
	, {
		mode = 'n',
		prefix = '<leader>',
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}
)

vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>')
vim.keymap.set('n', '}', '<cmd>AerialNext<CR>')
