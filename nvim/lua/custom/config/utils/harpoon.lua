local harpoon = require 'harpoon'
local wk = require 'which-key'

harpoon:setup {}

wk.register({
	['h'] = {
		name = "[H]arpoon",
['a'] = {
			function()
				harpoon:list():add()
			end,
			'Harpoon Add',
		},
		['e'] = {
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			'Harpoon Menu',
		},
		['x'] = {
			function()
				harpoon:list():remove()
			end,
			'Delete harpoon buffer',
		},
		['n'] = {
			function()
				harpoon:list():next()
			end,
			'Next harpoon buffer',
		},
		['p'] = {
			function()
				harpoon:list():prev()
			end,
			'Previous harpoon buffer',
		},
	},
}, {
	mode = 'n',
	prefix = '<leader>',
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
})

-- wk.register({
-- 	['<C-1>'] = {
-- 		function()
-- 			harpoon:list():select(1)
-- 		end,
-- 		'which_key_ignore',
-- 	},
-- 	['<C-2>'] = {
-- 		function()
-- 			harpoon:list():select(2)
-- 		end,
-- 		'which_key_ignore',
-- 	},
-- 	['<C-3>'] = {
-- 		function()
-- 			harpoon:list():select(3)
-- 		end,
-- 		'which_key_ignore',
-- 	},
-- 	['<C-4>'] = {
-- 		function()
-- 			harpoon:list():select(4)
-- 		end,
-- 		'which_key_ignore',
-- 	},
-- 	['<C-5>'] = {
-- 		function()
-- 			harpoon:list():select(5)
-- 		end,
-- 		'which_key_ignore',
-- 	},
-- }, {
-- 	mode = 'n',
-- 	buffer = nil,
-- 	silent = true,
-- 	noremap = true,
-- 	nowait = true,
-- })

-- Implementation not working with which-key so I just implemented it on the base nvim keymap function
vim.keymap.set('n', '<C-1>', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<C-2>', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<C-3>', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<C-4>', function() harpoon:list():select(4) end)
vim.keymap.set('n', '<C-5>', function() harpoon:list():select(5) end)
