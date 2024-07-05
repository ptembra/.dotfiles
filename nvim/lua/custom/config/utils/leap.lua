local wk = require("which-key")

wk.register(
	{
		["s"] = { "<Plug>(leap-forward)", "Leap forward" },
		["S"] = { "<Plug>(leap-backward)", "Leap backward" },
		["gs"] = { "<Plug>(leap-from-window)", "Leap from window" },
	}
	, {
		mode = { 'n', 'x', 'o' },
		prefix = '<leader>',
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	})
