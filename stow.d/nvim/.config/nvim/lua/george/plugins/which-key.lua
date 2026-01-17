return {
  "folke/which-key.nvim",
  dependencies = {
    { "echasnovski/mini.nvim", version = false },
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
  wk.add({
    { "<leader>z", "<cmd>set spell!<cr>", desc = "Toggle Spellcheck", mode = "n", silent = true, noremap = true },
    {
      mode = { "n", "v" },
      { "<C-y>", '"+y', desc = "Yank to Clipboard", icon = "", silent = true, noremap = true },
      { "<C-p>", '"+p', desc = "Paste from Clipboard", icon = "", silent = true, noremap = true },
    },
    mode = "n",
    { "<leader>w", group = "Vimwiki", icon = { icon = "󰠮", color = "purple" } },
    { "<leader>o", group = "Toggles", icon = { icon = "", color = "yellow" } },
    { "<leader>od",
        callback=function()
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end,
        desc = "Toggle Diagnostics" },
  })
  end,
}
