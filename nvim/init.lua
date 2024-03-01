-- GLOBALS
function P(v)
  print(vim.inspect(v))
  return v
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
