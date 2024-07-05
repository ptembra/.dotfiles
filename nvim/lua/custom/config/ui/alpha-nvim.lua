local dashboard = require('alpha.themes.dashboard')

local function header()
	local hydraASCII = {
		[[                                   ]],
		[[                                   ]],
		[[                                   ]],
		[[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
		[[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
		[[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
		[[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
		[[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
		[[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
		[[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
		[[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
		[[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
		[[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
		[[                                   ]] }
	local hour = tostring(os.date("%H"))
	local minute = tostring(os.date("%M"))

	local function currentGreet()
		local hour = tonumber(hour)
		if hour >= 5 and hour < 12 then
			return "morning"
		elseif hour >= 12 and hour < 17 then
			return "afternoon"
		elseif hour >= 17 and hour < 20 then
			return "evening"
		else
			return "night"
		end
	end

	if string.len(hour) == 1 then
		hour = "0" .. hour
	end

	if string.len(minute) == 1 then
		minute = "0" .. minute
	end

	local function getUsername()
		local username = os.getenv("USER")
		if username then
			return (username:gsub("^%l", string.upper))
		else
			return "User"
		end
	end

	local greet = "Good " ..
			currentGreet() .. ", " .. getUsername() .. ". It is " .. hour .. ":" .. minute
	local msg = {
		hydraASCII,
		greet
	}
	return vim.tbl_flatten(msg)
end

local function buttons()
	local btns = {
		dashboard.button("f", " Find file", ":Telescope find_files <CR>"),
		dashboard.button("r", " Recent files", ":Telescope oldfiles <CR>"),
		dashboard.button("u", " Update plugins", ":Lazy sync<CR>"),
		dashboard.button("m", " Update Mason", ":MasonUpdate<CR>"),
		dashboard.button("e", " Neotree", ":Neotree toggle<CR>"),
		dashboard.button("n", " New file", ":enew | startinsert<CR>"),
		dashboard.button("q", " Quit", ":qa<CR>"),
	}
	return btns
end

local function footer()
	local version = vim.version()
	return "Neovim " .. version.major .. "." .. version.minor .. "." .. version.patch
end

dashboard.section.header.val = header()
dashboard.section.header.opts.hl = "Keyword"
dashboard.section.header.opts.position = "center"
dashboard.section.header.type = "text"
-- make buttons cyan, in gruvbox
dashboard.section.buttons.opts.hl = "Type"
dashboard.section.footer.opts.hl = "Comment"
dashboard.opts.opts.noautocmd = true

dashboard.section.buttons.val = buttons()
dashboard.section.footer.val = footer()
require('alpha').setup(dashboard.opts)


-- items = {
--   { action = 'Telescope find_files', name = 'S: Find Files', section = 'Files' },
--   { action = 'Telescope oldfiles', name = 'R: Search Recent Files', section = 'Files' },
--   { action = 'Lazy sync', name = 'U: Update Plugins', section = 'Plugins' },
--   { action = 'MasonUpdate', name = 'M: Update Mason registries', section = 'Plugins' },
--   { action = 'Neotree toggle', name = 'E: Toggle Neotree', section = 'Builtin actions' },
--   { action = 'enew | startinsert', name = 'F: New File', section = 'Builtin actions' },
--   { action = 'qall!', name = 'Q: Quit Neovim', section = 'Builtin actions' },
-- },
