local M = {}

function M.plug_loaded(plugin)
	return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

function M.get_plug(name)
	return require("lazy.core.config").spec.plugins[name]
end

return M
