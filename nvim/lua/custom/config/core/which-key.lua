local wk = require 'which-key'

wk.setup {}

wk.add(
	{
		{ "<leader><Tab>", "<cmd>bnext<cr>",          desc = "Next buffer",        nowait = true, remap = false },
		{ "<leader>b",     group = "[B]uffers",       nowait = true,               remap = false },
		{ "<leader>bW",    "<cmd>w<cr>",              desc = "Save file",          nowait = true, remap = false },
		{ "<leader>b[",    "<cmd>bprev<cr>",          desc = "Previous buffer",    nowait = true, remap = false },
		{ "<leader>b]",    "<cmd>bnext<cr>",          desc = "Next buffer",        nowait = true, remap = false },
		{ "<leader>bq",    "<cmd>q!<cr>",             desc = "Force close buffer", nowait = true, remap = false },
		{ "<leader>e",     "<cmd>Neotree toggle<cr>", desc = "Neotree",            nowait = true, remap = false },
		{ "<leader>g",     nowait = true,             remap = false,               hidden = true },
		{
			"<leader>gd",
			function()
				require('telescope.builtin').lsp_definitions()
			end,
			desc = "Go to definition",
			nowait = true,
			remap = false
		},
		{ "<leader>l",  group = "[L]sp",                 nowait = true,            remap = false },
		{
			"<leader>la",
			function()
				vim.lsp.buf.code_action()
			end,
			desc = "Code action",
			nowait = true,
			remap = false
		},
		{
			"<leader>lf",
			function()
				vim.lsp.buf.format()
			end,
			desc = "Format buffer",
			nowait = true,
			remap = false
		},
		{
			"<leader>lh",
			function()
				vim.lsp.buf.hover()
			end,
			desc = "Hover",
			nowait = true,
			remap = false
		},
		{
			"<leader>lr",
			function()
				vim.lsp.buf.rename()
			end,
			desc = "Rename definition",
			nowait = true,
			remap = false
		},

		{ "<leader>p",  hidden = true,                   nowait = true,            remap = false },
		{ "<leader>ps", "<cmd>Telescope find_files<cr>", desc = "[P]ath [S]earch", nowait = true, remap = false },
		{
			"<leader>q",
			function()
				require('mini.bufremove').delete(0, true)
			end,
			desc = "Soft Quit Buffer",
			nowait = true,
			remap = false
		},
		{ "<leader>t",  group = "[T]elescope",            nowait = true,                         remap = false },
		{ "<leader>tb", "<cmd>Telescope buffers<cr>",     desc = "Search buffers",               nowait = true, remap = false },
		{ "<leader>tc", "<cmd>Telescope commands<cr>",    desc = "Search commands",              nowait = true, remap = false },
		{ "<leader>tf", "<cmd>Telescope find_files<cr>",  desc = "Search files",                 nowait = true, remap = false },
		{ "<leader>tg", "<cmd>Telescope live_grep<cr>",   desc = "Search with grep",             nowait = true, remap = false },
		{ "<leader>th", "<cmd>Telescope help_tags<cr>",   desc = "Search help menu",             nowait = true, remap = false },
		{ "<leader>tk", "<cmd>Telescope keymaps<cr>",     desc = "Search keymaps",               nowait = true, remap = false },
		{ "<leader>tr", "<cmd> Telescope oldfiles",       desc = "Search recently opened files", nowait = true, remap = false },
		{ "<leader>ts", "<cmd>Telescope grep_string<cr>", desc = "Search with grep",             nowait = true, remap = false },
		{ "<leader>u",  group = "[U]tils",                nowait = true,                         remap = false },
		{ "<leader>ur", "<cmd>nohl<cr>",                  desc = "Clear highlights",             nowait = true, remap = false },
	}
)
