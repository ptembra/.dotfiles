local function show_macro_recording()
    local status, macro = pcall(vim.fn.reg_recording)
    if string.len(macro) < 1 then
        return ""
    end
    return string.format('Recording @%s', macro)
end

vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        require("lualine").refresh({
            place = { "statusline" }
        })
    end
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        local timer = vim.loop.new_timer()
        timer:start(
            50, 0, vim.schedule_wrap(function()
                require("lualine").refresh({
                    place = { "statusline" }
                })
            end
            ))
    end
})

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = 'everforest'
        },
        sections = {
            lualine_b = {
                {
                    "macro-recording",
                    fmt = show_macro_recording,
                    color = { gui = 'bold', fg = 'white', bg = 'red' },
                    separator = { left = '', right = '' }
                }
            }
        }
    }
}
