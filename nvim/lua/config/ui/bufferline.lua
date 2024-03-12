require("bufferline").setup({
	options = {
		close_command= function(n) require("mini.bufremove").delete(n, false) end,
		left_mouse_command = "buffer %d",
		diagnostics = "nvim_lsp",
		always_show_bufferline = false,
		offsets = {
			{
				filetype = "neo-tree", text = "Neo-tree", highlight = "Directory", text_align = "left" }
		}
	}
}
)
