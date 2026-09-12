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
    event = "VeryLazy",
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      require("nvim-tree").setup({
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
        },
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
        end,
      })

      vim.api.nvim_create_autocmd("QuitPre", {
        group = augroup,
        callback = function()
          local tree_wins = {}
          local floating_wins = {}
          local wins = vim.api.nvim_list_wins()
          for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
              table.insert(tree_wins, w)
            end
            if vim.api.nvim_win_get_config(w).relative ~= "" then
              table.insert(floating_wins, w)
            end
          end
          if 1 == #wins - #floating_wins - #tree_wins then
            for _, w in ipairs(tree_wins) do
              vim.api.nvim_win_close(w, true)
            end
          end
        end,
      })

      local wk = require("which-key")
      wk.add({
        mode = { "n" },
        {
          { "<leader>n",  group = "Nvim Tree" },
          { "<leader>nn", "<cmd>NvimTreeToggle<cr>",   desc = "Toggle Nvim Tree" },
          { "<leader>nr", "<cmd>NvimTreeClose<bar>NvimTreeOpen<cr>",  desc = "Restart Nvim Tree" },
          { "<leader>nf", "<cmd>NvimTreeFindFile<cr>", desc = "Nvim Tree Find Current File" },
        },
      })
    end,
  },
}
