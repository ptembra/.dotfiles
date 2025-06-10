require("aerial").setup()

require('which-key').add(
	{
		{ "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial", nowait = true, remap = false },
	}
)

vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>')
vim.keymap.set('n', '}', '<cmd>AerialNext<CR>')
