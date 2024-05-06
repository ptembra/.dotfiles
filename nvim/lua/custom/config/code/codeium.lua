
    vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end)
    vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end)
