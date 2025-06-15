return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    ---@module 'bufferline'
    ---@type bufferline.UserConfig
    opts = {
        options = {
            close_command = function(n) require("mini.bufremove").delete(n, false) end,
            left_mouse_command = "buffer %d",
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
        }
    },
}
