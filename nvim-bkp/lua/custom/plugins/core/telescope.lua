return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function()
      require("nvim.lua.plugins.core.telescope").load_extension("fzf")
    end
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  -- Useful for getting pretty icons, but requires a Nerd Font.
  { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
}
