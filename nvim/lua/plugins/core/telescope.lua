return {
  'nvim-telescope/telescope.nvim', version = '*', -- latest release
  cmd = 'Telescope', -- loads on first :Telescope (or require('telescope...'))
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    },
  },
  config = function()
    require('telescope').setup({})
    require('telescope').load_extension('fzf')
  end,
}
