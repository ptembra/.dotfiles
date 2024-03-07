local M = {}
function M.load_directory(dir, base, exclude)
 	local exclude = exclude or {}

	-- Exclude init file
	exclude["init"] = true
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
		
		if not name then
			break
		end
	
		local req = vim.fn.fnamemodify(name, ":r")
		local extension = vim.fn.fnamemodify(name, ":e")

		if ((extension == "lua" and typ == "file")) and not exclude[req] then
			success, response = pcall(require, base..req)

			if success then
				table.insert(mods, response)
			else
				error("Couldn't load module " .. req .. ": " .. response)
			end
		end
	end
	return mods
end
return M
