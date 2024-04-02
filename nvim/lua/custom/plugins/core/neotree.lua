return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
		'MunifTanjim/nui.nvim',
	},
	config = function()
		require('which-key').register({
			e = { '<cmd>:Neotree toggle<cr>', 'Toggle Neotree' },
		}, { prefix = '<leader>' })
	end,
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
			},
		},
	},
}
