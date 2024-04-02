local wk = require 'which-key'

wk.setup {}

local mappings = {
	['g'] = {
		name = 'which_key_ignore',
		{
			['d'] = {
				function()
					require('telescope.builtin').lsp_definitions()
				end,
				'Go to definition',
			},
		},
	},
	['e'] = { '<cmd>Neotree toggle<cr>', 'Neotree' },
	['<Tab>'] = { '<cmd>bnext<cr>', 'Next buffer' },
	['p'] = {
		"which_key_ignore"
	},
	['ps'] = { '<cmd>Telescope find_files<cr>', '[P]ath [S]earch' },
	['q'] = {
		function()
			require('mini.bufremove').delete(0, true)
		end,
		'Soft Quit Buffer',
	},
	['s'] = {
		name = '[S]earch',
		['h'] = { '<cmd>Telescope help_tags<cr>', 'Search help menu' },
		['b'] = { '<cmd>Telescope buffers<cr>', 'Search buffers' },
		['r'] = { '<cmd> Telescope oldfiles', 'Search recently opened files' },
		['g'] = { '<cmd>Telescope live_grep<cr>', 'Search with grep' },
		['f'] = { '<cmd>Telescope find_files<cr>', 'Search files' },
		['c'] = { '<cmd>Telescope commands<cr>', 'Search commands' },
		['s'] = { '<cmd>Telescope grep_string<cr>', 'Search with grep' },
		['k'] = { '<cmd>Telescope keymaps<cr>', 'Search keymaps' },
	},
	['b'] = {
		name = '[B]uffers',
		['q'] = { '<cmd>q!<cr>', 'Force close buffer' },
		['W'] = { '<cmd>w<cr>', 'Save file' },
		[']'] = { '<cmd>bnext<cr>', 'Next buffer' },
		['['] = { '<cmd>bprev<cr>', 'Previous buffer' },
	},
	['u'] = {
		name = '[U]tils',
		['r'] = { '<cmd>nohl<cr>', 'Clear highlights' },
		['n'] = {
			function()
				require('notify').dismiss { silent = true, pending = true }
			end,
			'Dismiss notifications',
		},
	},
	['l'] = {
		name = '[L]sp',
		['f'] = {
			function()
				vim.lsp.buf.format()
			end,
			'Format buffer',
		},
		['r'] = {
			function()
				vim.lsp.buf.rename()
			end,
			'Rename definition',
		},
		['a'] = {
			function()
				vim.lsp.buf.code_action()
			end,
			'Code action',
		},
		['h'] = {
			function()
				vim.lsp.buf.hover()
			end,
			'Hover',
		}
	},
	['t'] = {
		name = '[T]erminal',
		['/'] = { '<cmd>ToggleTerm direction=horizontal<cr>', 'Toggle horizontal terminal' },
		['f'] = { '<cmd>ToggleTerm direction=float<cr>', 'Toggle floating terminal' },
	},
}

wk.register(mappings, {
	mode = 'n',
	prefix = '<leader>',
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
})
