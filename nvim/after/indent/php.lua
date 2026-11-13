-- Must be after/indent: indent/php.vim runs after ftplugin and would reset indentexpr
require('php_template_indent').setup(0)
vim.b.undo_indent = (vim.b.undo_indent and (vim.b.undo_indent .. '|') or '') .. 'setl inde< indk<'
