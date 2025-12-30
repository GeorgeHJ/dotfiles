return {
  {
    "vifm/vifm.vim",
    event = "VeryLazy",
    ft = "vifm",
    init = function()
      vim.g.vifm_exec = "TERM=kitty-direct vifm"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "folke/which-key.nvim" },
    cmd = "NvimTreeToggle",
    keys = {
      { "<leader>n", desc = "Toggle Nvim Tree" },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      require("nvim-tree").setup({
        diagnostics = {
          enable = true,
          severity = {
            min = vim.diagnostic.severity.WARN,
          },
          icons = {
            error = "󰅚 ",
            warning = "󰀪 ",
            hint = "󰌶 ",
            info = " ",
          },
        },
      })

      local augroup = vim.api.nvim_create_augroup("NvimTreeEvents", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        pattern = { "FugitiveChanged", "GitSignsUpdate" },
        group = augroup,
        callback = function()
          vim.schedule(function()
            vim.cmd("NvimTreeRefresh")
          end)
        end
      })

      local wk = require("which-key")
      wk.add({
        mode = { "n" },
        { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Nvim Tree" },
      })
    end,
  },
}
