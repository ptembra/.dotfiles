return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    view_options = {
      show_hidden = true,

      -- Defines what's a hidden file
      is_hidden_file = function(name, _)
        local m = name:match("^%.")
        return m ~= nil
      end,

      -- Hides always
      is_always_hidden = function(name, _)
        local m = name:match(".DS_Store")
        return m ~= nil
      end,
    },

    preview_win = {
      update_on_cursor_moved = true,
      disable_preview = function()
        return false
      end
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
