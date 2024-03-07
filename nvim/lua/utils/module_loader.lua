local M = {}

function M.load_directory(dir, base, exclude)
	local exc = exclude or {}

	-- Exclude init file
	exc["init"] = true
	if dir and string.sub(dir, 1, 1) == "@" then
		dir = string.sub(dir, 2)
	end

	local handle = vim.loop.fs_scandir(dir)
	local mods = {}

	if not handle then
		error("Can't load directory " .. dir)
	end
	while handle do
		local name, typ = vim.loop.fs_scandir_next(handle)
		local nestedLevel = 0

		if not name then
			break
		end

		local file_root = vim.fn.fnamemodify(name, ":r")
		local extension = vim.fn.fnamemodify(name, ":e")
		if (typ == "directory" and not exc[file_root]) and nestedLevel <= 1 then
			nestedLevel = nestedLevel + 1

			local nested_dir = dir .. "/" .. name
			local nested_handle = vim.loop.fs_scandir(dir .. "/" .. name)

			if not nested_handle then
				error("Can't load nested directory" .. nested_dir)
			end

			while nested_handle do
				local nested_name, nested_type = vim.loop.fs_scandir_next(nested_handle)

				if not nested_name then
					break
				end

				local nested_file_root = vim.fn.fnamemodify(nested_name, ":r")
				local nested_file_extension = vim.fn.fnamemodify(nested_name, ":e")

				if (nested_file_extension == "lua" and nested_type == "file") and not exc[nested_file_root] then
					local success, response = pcall(require, base .. file_root .. "." .. nested_file_root)

					if success then
						table.insert(mods, response)
					else
						print("Couldn't load nested module " .. nested_file_root .. ": " .. response)
					end
				end
			end
		else
			nestedLevel = 0
			if ((extension == "lua" and typ == "file")) and not exc[file_root] then
				local success, response = pcall(require, base .. file_root)

				if success then
					table.insert(mods, response)
				else
					print("Couldn't load module " .. file_root .. ": " .. response)
				end
			end
		end
	end
	return mods
end

return M
