return {
  -- for nvim plugin development
  { "folke/neodev.nvim", opts = {}, lazy = false },
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
      popupmenu = {
        enabled = false,
      },
    },
  },
  { "https://github.com/Raimondi/delimitMate" },
  { "https://github.com/tpope/vim-surround", lazy = false },
  { "wuelnerdotexe/vim-astro", lazy = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            "node_modules",
            "__pycache__",
            "lua_modules",
          },
        },
      },
    },
  },
  -- { "https://github.com/fladson/vim-kitty" },
}
