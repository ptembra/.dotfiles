local wk = require('which-key')

-- OIL
local oil = require("oil")
wk.add({
  {
    "<leader>o",
    function()
      oil.open()
    end,
    desc = "Open [O]il"
  }
})

-- General Utils
wk.add({
  { "<leader>u",  group = "[U]tils", nowait = true,             remap = false },
  { "<leader>ur", "<cmd>nohl<cr>",   desc = "Clear highlights", nowait = true, remap = false },
})

-- Telescope
wk.add({
  { "<leader>t",  group = "[T]elescope",            nowait = true,                         remap = false },
  { "<leader>tb", "<cmd>Telescope buffers<cr>",     desc = "Search buffers",               nowait = true, remap = false },
  { "<leader>tc", "<cmd>Telescope commands<cr>",    desc = "Search commands",              nowait = true, remap = false },
  { "<leader>tf", "<cmd>Telescope find_files<cr>",  desc = "Search files",                 nowait = true, remap = false },
  { "<leader>tg", "<cmd>Telescope live_grep<cr>",   desc = "Search with grep",             nowait = true, remap = false },
  { "<leader>th", "<cmd>Telescope help_tags<cr>",   desc = "Search help menu",             nowait = true, remap = false },
  { "<leader>tk", "<cmd>Telescope keymaps<cr>",     desc = "Search keymaps",               nowait = true, remap = false },
  { "<leader>tr", "<cmd>Telescope oldfiles<cr>",    desc = "Search recently opened files", nowait = true, remap = false },
  { "<leader>ts", "<cmd>Telescope grep_string<cr>", desc = "Search with grep",             nowait = true, remap = false },
  { "<leader>ps", "<cmd>Telescope find_files<cr>",  desc = "[P]ath [S]earch",              nowait = true, remap = false },
})


-- Buffer Utils
wk.add({
  { "<leader>b",     group = "[B]uffers", nowait = true,               remap = false },
  { "<leader><Tab>", "<cmd>bnext<cr>",    desc = "Next buffer",        nowait = true, remap = false },
  { "<leader>bW",    "<cmd>w<cr>",        desc = "Save file",          nowait = true, remap = false },
  { "<leader>b[",    "<cmd>bprev<cr>",    desc = "Previous buffer",    nowait = true, remap = false },
  { "<leader>b]",    "<cmd>bnext<cr>",    desc = "Next buffer",        nowait = true, remap = false },
  { "<leader>bq",    "<cmd>q!<cr>",       desc = "Force close buffer", nowait = true, remap = false },
  {
    "<leader>q",
    function()
      require('mini.bufremove').delete(0, true)
    end,
    desc = "Soft Quit Buffer",
    nowait = true,
    remap = false
  },
})

-- LSP
wk.add({
  { "<leader>g", nowait = true,   remap = false, hidden = true },
  {
    "<leader>gd",
    function()
      require('telescope.builtin').lsp_definitions()
    end,
    desc = "Go to definition",
    nowait = true,
    remap = false
  },
  { "<leader>l", group = "[L]sp", nowait = true, remap = false },
  {
    "<leader>la",
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "Code action",
    nowait = true,
    remap = false
  },
  {
    "<leader>lf",
    function()
      vim.lsp.buf.format()
    end,
    desc = "Format buffer",
    nowait = true,
    remap = false
  },
  {
    "<leader>lh",
    function()
      vim.lsp.buf.hover()
    end,
    desc = "Hover",
    nowait = true,
    remap = false
  },
  {
    "<leader>lr",
    function()
      vim.lsp.buf.rename()
    end,
    desc = "Rename definition",
    nowait = true,
    remap = false
  },
})

-- TROUBLE
wk.add({
  { "<leader>d",  group = "[D]iagnostics" },
  { "<leader>dc", "<cmd>Trouble diagnostics toggle<cr>",           desc = "Toggle Diagnostics" },
  { "<leader>dl", "<cmd>Trouble loclist toggle <cr>",              desc = "Loclist" },
  { "<leader>dq", "<cmd>Trouble qflist toggle<cr>",                desc = "Quickfix" },
  { "<leader>dr", "<cmd>Trouble lsp_references toggle<cr>",        desc = "References" },
  { "<leader>dw", "<cmd>Trouble workspace_diagnostics toggle<cr>", desc = "Workspace Diagnostics" },
})

-- AERIAL
wk.add({
  {
    { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial", nowait = true, remap = false },
  }
})

-- SURROUND
