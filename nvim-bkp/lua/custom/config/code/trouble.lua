local wk = require('which-key')

wk.add(
	{
		{ "<leader>d",  group = "[D]iagnostics" },
		{ "<leader>dc", "<cmd>Trouble diagnostics toggle<cr>",          desc = "Toggle Diagnostics" },
		{ "<leader>dl", "<cmd>Trouble loclist toggle <cr>",             desc = "Loclist" },
		{ "<leader>dq", "<cmd>Trouble qflist toggle<cr>",               desc = "Quickfix" },
		{ "<leader>dr", "<cmd>Trouble lsp_references toggle<cr>",       desc = "References" },
		{ "<leader>dw", "<cmd>Trouble workspace_diagnostics toggle<cr>", desc = "Workspace Diagnostics" },
	}
)
