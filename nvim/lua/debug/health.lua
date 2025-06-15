local M = {}

-- Store the debug info during loading
local debug_info = {
  loaded_modules = {},
  skipped_modules = {},
  failed_modules = {},
  total_count = 0
}

-- Function to add debug info (call this from your loader)
function M.add_debug_info(module_name, status, details)
  if status == "loaded" then
    table.insert(debug_info.loaded_modules, module_name)
  elseif status == "skipped" then
    table.insert(debug_info.skipped_modules, { name = module_name, reason = details })
  elseif status == "failed" then
    table.insert(debug_info.failed_modules, { name = module_name, error = details })
  end
  debug_info.total_count = debug_info.total_count + 1
end

-- Health check function
function M.check()
  vim.health.start("Plugin Module Loader")

  -- Summary
  vim.health.info(string.format("Total modules processed: %d", debug_info.total_count))
  vim.health.info(string.format("Successfully loaded: %d", #debug_info.loaded_modules))

  if #debug_info.skipped_modules > 0 then
    vim.health.warn(string.format("Skipped modules: %d", #debug_info.skipped_modules))
  else
    vim.health.ok("No modules skipped")
  end

  if #debug_info.failed_modules > 0 then
    vim.health.error(string.format("Failed modules: %d", #debug_info.failed_modules))
  else
    vim.health.ok("No modules failed to load")
  end

  -- Detailed info
  if #debug_info.loaded_modules > 0 then
    vim.health.info("Loaded modules:")
    for _, module in ipairs(debug_info.loaded_modules) do
      vim.health.info("  • " .. module)
    end
  end

  if #debug_info.skipped_modules > 0 then
    vim.health.warn("Skipped modules:")
    for _, module in ipairs(debug_info.skipped_modules) do
      vim.health.warn("  • " .. module.name .. " (" .. module.reason .. ")")
    end
  end

  if #debug_info.failed_modules > 0 then
    vim.health.error("Failed modules:")
    for _, module in ipairs(debug_info.failed_modules) do
      vim.health.error("  • " .. module.name .. ": " .. module.error)
    end
  end
end

return M
