-- require("which-key").register(
-- 	{
-- 		["G"] = {
-- 			name = "[G]it",
-- 			["g"] = { "<cmd>Git<CR>", "Git" },
-- 			["c"] = { "<cmd>Git commit<cr>", "Git commit" },
-- 			["a"] = { "<cmd>Git add<cr>", "Git add" },
-- 			["b"] = { "<cmd>Git blame<cr>", "Git blame" },
-- 			["d"] = { "<cmd>Git diff<cr>", "Git diff" },
-- 			["s"] = { "<cmd>Git status<cr>", "Git status" },
-- 			["p"] = { "<cmd>Git push<cr>", "Git push" },
-- 			["P"] = { "<cmd>Git pull<cr>", "Git pull" },
-- 		}
-- 	}
-- 	, {
-- 		mode = 'n',
-- 		prefix = '<leader>',
-- 		buffer = nil,
-- 		silent = true,
-- 		noremap = true,
-- 		nowait = true,
-- 	})
require("which-key").add(
	{
		{ "<leader>G",  group = "[G]it",       nowait = true,       remap = false },
		{ "<leader>GP", "<cmd>Git pull<cr>",   desc = "Git pull",   nowait = true, remap = false },
		{ "<leader>Ga", "<cmd>Git add<cr>",    desc = "Git add",    nowait = true, remap = false },
		{ "<leader>Gb", "<cmd>Git blame<cr>",  desc = "Git blame",  nowait = true, remap = false },
		{ "<leader>Gc", "<cmd>Git commit<cr>", desc = "Git commit", nowait = true, remap = false },
		{ "<leader>Gd", "<cmd>Git diff<cr>",   desc = "Git diff",   nowait = true, remap = false },
		{ "<leader>Gg", "<cmd>Git<CR>",        desc = "Git",        nowait = true, remap = false },
		{ "<leader>Gp", "<cmd>Git push<cr>",   desc = "Git push",   nowait = true, remap = false },
		{ "<leader>Gs", "<cmd>Git status<cr>", desc = "Git status", nowait = true, remap = false },
	}
)
