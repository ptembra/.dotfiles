local wk = require("which-key")

-- wk.register(
-- 	{
-- 		["s"] = { "<Plug>(leap-forward)", "Leap forward" },
-- 		["S"] = { "<Plug>(leap-backward)", "Leap backward" },
-- 		["gs"] = { "<Plug>(leap-from-window)", "Leap from window" },
-- 	}
-- 	, {
-- 		mode = { 'n', 'x', 'o' },
-- 		prefix = '<leader>',
-- 		buffer = nil,
-- 		silent = true,
-- 		noremap = true,
-- 		nowait = true,
-- 	})

wk.add(
	{
		{
			mode = { "n", "o", "x" },
			{ "<leader>S",  "<Plug>(leap-backward)",    desc = "Leap backward",    nowait = true, remap = false },
			{ "<leader>gs", "<Plug>(leap-from-window)", desc = "Leap from window", nowait = true, remap = false },
			{ "<leader>s",  "<Plug>(leap-forward)",     desc = "Leap forward",     nowait = true, remap = false },
		},
	}
)
