local load_directory = require('utils.module_loader').load_directory
local loadedDir = load_directory(vim.fn.stdpath 'config' .. '/lua/config', 'config.')

-- Config table
local C = {
  loadedDir,
}
return C
