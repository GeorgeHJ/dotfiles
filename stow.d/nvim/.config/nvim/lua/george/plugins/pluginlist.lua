return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
      local ft = require("Comment.ft")
      ft({ "vimwiki", "markdown" }, { "<!--%s-->", "<!--%s-->" })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup()
      vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        icons_enabled = true,
        theme = "kanagawa",
        sections = {
          lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
        },
      })
    end,
  },
  {
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
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },
  {
    "romainl/vim-cool",
    event = "VeryLazy",
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "ron-rs/ron.vim",
    event = "VeryLazy",
  },
}
