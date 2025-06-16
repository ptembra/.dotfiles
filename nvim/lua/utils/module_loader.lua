local M = {}
local health = require('debug.health')

local function debug_print(msg)
	if vim.o.verbose >= 1 then
		print(msg)
	end
end

local function load_module(module_path, name)
	debug_print("Loading module: " .. module_path)

	local success, response = pcall(require, module_path)
	if not success then
		debug_print("Couldn't load module " .. name .. ": " .. tostring(response))
		return nil
	end

	if type(response) == "table" then
		health.add_debug_info(name, "loaded", "")
		return response
	else
		debug_print("Skipping module " .. name .. " - returned " .. type(response))
		health.add_debug_info(name, "skipped", "returned " .. type(response))

		return nil
	end
end

local function process_lua_file(name, base, exclude)
	local file_root = vim.fn.fnamemodify(name, ":r")
	local extension = vim.fn.fnamemodify(name, ":e")

	if extension == "lua" and not exclude[file_root] then
		return load_module(base .. file_root, file_root)
	end
	return nil
end

local function process_directory(dir, name, base, exclude)
	local file_root = vim.fn.fnamemodify(name, ":r")
	if exclude[file_root] then
		return {}
	end

	local nested_dir = dir .. "/" .. name
	local nested_handle = vim.loop.fs_scandir(nested_dir)
	local mods = {}

	if not nested_handle then
		debug_print("Can't load nested directory " .. nested_dir)
		return mods
	end

	while true do
		local nested_name, nested_type = vim.loop.fs_scandir_next(nested_handle)
		if not nested_name then break end

		if nested_type == "file" then
			local nested_file_root = vim.fn.fnamemodify(nested_name, ":r")
			local nested_extension = vim.fn.fnamemodify(nested_name, ":e")

			if nested_extension == "lua" and not exclude[nested_file_root] then
				local module_path = base .. file_root .. "." .. nested_file_root
				local mod = load_module(module_path, nested_file_root)
				if mod then
					table.insert(mods, mod)
				end
			end
		end
	end

	return mods
end

function M.load_directory(dir, base, exclude)
	local exc = exclude or {}
	exc["init"] = true

	if dir and string.sub(dir, 1, 1) == "@" then
		dir = string.sub(dir, 2)
	end

	local handle = vim.loop.fs_scandir(dir)
	if not handle then
		error("Can't load directory " .. dir)
	end

	local mods = {}

	while true do
		local name, typ = vim.loop.fs_scandir_next(handle)
		if not name then break end

		if typ == "directory" then
			local dir_mods = process_directory(dir, name, base, exc)
			for _, mod in ipairs(dir_mods) do
				table.insert(mods, mod)
			end
		elseif typ == "file" then
			local mod = process_lua_file(name, base, exc)
			if mod then
				table.insert(mods, mod)
			end
		end
	end

	return mods
end

return M
