require("which-key").register(
	{
		["G"] = {
			name = "[G]it",
			["g"] = { "<cmd>Git<CR>", "Git" },
			["c"] = { "<cmd>Git commit<cr>", "Git commit" },
			["a"] = { "<cmd>Git add<cr>", "Git add" },
			["b"] = { "<cmd>Git blame<cr>", "Git blame" },
			["d"] = { "<cmd>Git diff<cr>", "Git diff" },
			["s"] = { "<cmd>Git status<cr>", "Git status" },
			["p"] = { "<cmd>Git push<cr>", "Git push" },
			["P"] = { "<cmd>Git pull<cr>", "Git pull" },
		}
	}
	, {
		mode = 'n',
		prefix = '<leader>',
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	})
