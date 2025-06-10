return {
  "neanias/everforest-nvim",
  config = function()
    require("everforest").setup({
      background = "hard",
      ui_contrast = "high",
    })
  end,
  version = false,
  lazy = false,
  priority = 1000,
}
