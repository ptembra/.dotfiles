local wk = require("which-key")

wk.setup({})

local mappings = {
	["e"] = { "<cmd>Neotree toggle<cr>", "Neotree" },
	["<Tab>"] = { "<cmd>bnext<cr>", "Next buffer" },
	["ps"] = { "<cmd>Telescope find_files<cr>", "Path Search" },
	["q"] = { function() require("mini.bufremove").delete(0, true) end, "Soft Quit" },
	["s"] = {
		name = "search",
		["h"] = { "<cmd>Telescope help_tags<cr>", "Search help menu" },
		["b"] = { "<cmd>Telescope buffers<cr>", "Search buffers" },
		["r"] = { "<cmd> Telescope oldfiles", "Search recently opened files" }
	},
	["b"] = {
		name = "buffers",
		["q"] = { "<cmd>q!<cr>", "Force close buffer" },
		["W"] = { "<cmd>w<cr>", "Save file" },
		["]"] = { "<cmd>bnext<cr>", "Next buffer" },
		["["] = { "<cmd>bprev<cr>", "Previous buffer" }
	},
	["u"] = {
		name = "utils",
		["r"] = { "<cmd>nohl<cr>", "Clear highlights" },
		["n"] = { function() require("notify").dismiss({ silent = true, pending = true }) end, "Dismiss notifications" }
	},
	["l"] = {
		name = "lsp",
		["f"] = { function() vim.lsp.buf.format() end, "Format buffer" },
		["r"] = { function() vim.lsp.buf.rename() end, "Rename definition" }
	},
	["t"] = {
		name = "terminal",
		["/"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "Toggle horizontal terminal" },
		["f"] = { "<cmd>ToggleTerm direction=float<cr>", "Toggle floating terminal" }
	}
}

wk.register(mappings, {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true
})
