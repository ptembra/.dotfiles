require("nvim-surround").setup({
  keymaps = {
    normal_cur_line = "gZgZ",
    insert = "<C-g>z",
    insert_line = "gC-ggZ",
    normal = "gz",
    normal_line = "gzgz",
    normal_cur = "gZ",
    visual = "gz",
    visual_line = "gZ",
    delete = "gzd",
    change = "gzc",
  },
})
