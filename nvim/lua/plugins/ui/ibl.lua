return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function(_, opts)
        vim.g.indent_blankline_use_treesitter = true
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }

        local whitespaceHighlight = {
            "CursorColumn"
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E67E80" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#DBBC7F" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7FBBB3" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#E69875" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A7C080" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#D699B6" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#83C092" })
        end)
        require("ibl").setup({
            indent = {
                highlight = highlight,
                char = "┆"
            },
            whitespace = {
                -- remove_blankline_trail = false
            },
            scope = {
                enabled = true
            }
        })
    end,
}
