-- Auto-closes/renames html tags (uses the treesitter html parser; works in php, svelte, tsx...)
return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
