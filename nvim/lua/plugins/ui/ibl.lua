return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function(_, _)
        vim.g.indent_blankline_use_treesitter = true
        local highlight = {
            "RainbowBlue",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7FBBB3" })
        end)
        require("ibl").setup({
            indent = {
                char = "┆"
            },
            scope = {
                enabled = true,
                highlight = highlight
            }
        })
    end,
}
