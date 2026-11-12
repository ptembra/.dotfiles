return {
  'nvim-telescope/telescope.nvim', version = '*', -- latest release
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
