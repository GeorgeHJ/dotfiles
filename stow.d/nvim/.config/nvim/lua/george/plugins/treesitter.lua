return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
      require("nvim-treesitter").install({
        "vim",
        "vimdoc",
        "lua",
        "python",
        "bash",
        "latex",
        "markdown",
        "markdown_inline",
        "yaml",
        "html",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "folke/which-key.nvim",
    },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
      })
      local wk = require("which-key")
      local select = require("nvim-treesitter-textobjects.select").select_textobject
      wk.add({
         mode = { "x", "o" },
        {
          "af",
          function()
            select("@function.outer", "textobjects")
          end,
          desc = "Select outer function",
        },
        {
          "if",
          function()
            select("@function.inner", "textobjects")
          end,
          desc = "Select inner function",
        },
        {
          "ac",
          function()
            select("@class.outer", "textobjects")
          end,
          desc = "Select outer class",
        },
        {
          "ic",
          function()
            select("@class.inner", "textobjects")
          end,
          desc = "Select inner class",
        },
        {
          "al",
          function()
            select("@loop.outer", "textobjects")
          end,
          desc = "Select outer loop",
        },
        {
          "il",
          function()
            select("@loop.inner", "textobjects")
          end,
          desc = "Select inner loop",
        },
      })
    end,
  },
}
