local harpoon = require 'harpoon'
local wk = require 'which-key'

harpoon:setup {}

wk.register({
	['a'] = {
		function()
			harpoon:list():add()
		end,
		'Harpoon Add',
	},
	['h'] = {
		name = "[H]arpoon",
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
wk.register({
	['<c-1>'] = {
		function()
			harpoon:list():select(1)
		end,
		'which_key_ignore',
	},
	['<c-2>'] = {
		function()
			harpoon:list():select(2)
		end,
		'which_key_ignore',
	},
	['<c-3>'] = {
		function()
			harpoon:list():select(3)
		end,
		'which_key_ignore',
	},
	['<c-4>'] = {
		function()
			harpoon:list():select(4)
		end,
		'which_key_ignore',
	},
	['<c-5>'] = {
		function()
			harpoon:list():select(5)
		end,
		'which_key_ignore',
	},
}, {
	mode = 'n',
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
})
