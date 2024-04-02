local wk = require('which-key')

wk.register({
	['d'] = {
		name = '[D]iagnostics',
		['c'] = { '<cmd>TroubleToggle<cr>', 'Toggle Diagnostics' },
		['w'] = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace Diagnostics' },
		['d'] = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Document Diagnostics' },
		['q'] = { '<cmd>TroubleToggle quickfix<cr>', 'Quickfix' },
		['l'] = { '<cmd>TroubleToggle loclist<cr>', 'Loclist' },
		['r'] = { '<cmd>TroubleToggle lsp_references<cr>', 'References' },
	}
}, { prefix = '<leader>', mode = 'n' })
