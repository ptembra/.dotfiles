require("mini.starter").setup({
	content_hooks = {
		require("mini.starter").gen_hook.adding_bullet(""),
		require("mini.starter").gen_hook.aligning("center", "center"),
	},
	evaluate_single = true,
	footer = os.date(),
	header = table.concat({
		[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
		[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
		[[/ /\  /  __/ (_) \ V /| | | | | | |]],
		[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
		[[───────────────────────────────────]],
	}, "\n"),
	query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
	items = {
		{ action = "Telescope find_files", name = "S: Find Files",              section = "Files" },
		{ action = "Telescope oldfiles",  name = "R: Search Recent Files",     section = "Files" },
		{ action = "Lazy sync",            name = "U: Update Plugins",          section = "Plugins" },
		{ action = "MasonUpdate",          name = "M: Update Mason registries", section = "Plugins" },
		{ action = "Neotree toggle",       name = "E: Toggle Neotree",          section = "Builtin actions" },
		{ action = "ene | startinsert",    name = "N: New File",                section = "Builtin actions" },
		{ action = "qall!",                name = "Q: Quit Neovim",             section = "Builtin actions" },
	},
})
