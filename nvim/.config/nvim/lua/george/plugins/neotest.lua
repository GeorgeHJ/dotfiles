return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "folke/which-key.nvim"
  },
  keys = {
  },
  ft = { "python" },
  config = function ()
    local wk = require("which-key")
    local icon = { icon = " ", color = "orange" }
    local nt = require("neotest")
---@diagnostic disable-next-line: missing-fields
    nt.setup({
      adapters = {
        require("neotest-python"),
      }
    })
    wk.add({
      mode = "n",
      { { "<leader>tr", callback = function() nt.run.run() end, desc = "Run Test", icon = icon },
      { "<leader>ti", callback = function() nt.output.open() end, desc = "Get Test Output", icon = icon },
      { "<leader>ts", callback = function () nt.summary.toggle() end, desc = "Show Test Summary", icon = icon },
      { "<leader>ta", callback = function() nt.run.run({ suite = true }) end, desc = "Run All Tests", icon = icon },
      },
    })
  end
}
