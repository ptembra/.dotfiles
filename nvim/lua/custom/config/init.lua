local load_directory = require('custom.utils.module_loader').load_directory
local loadedDir = load_directory(vim.fn.stdpath 'config' .. '/lua/custom/config', 'custom.config.')

-- Plugins table
local P = {
  loadedDir,
}
return P
