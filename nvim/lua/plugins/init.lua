load_directory = require("utils.module_loader").load_directory

local loadedDir = load_directory(vim.fn.stdpath("config") .. "/lua/plugins", "plugins.")
-- Plugins table
local P = {
	loadedDir
}

return P
