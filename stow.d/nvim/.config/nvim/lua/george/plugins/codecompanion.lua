return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "folke/which-key.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("codecompanion").setup({
      adapters = {
        http = {
          openrouter = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://openrouter.ai/api",
                api_key = function()
                  return vim.fn.system("pass show openrouter-coding"):gsub("\n", "")
                end,
                chat_url = "/v1/chat/completions",
              },
              schema = {
                model = {
                  default = "inception/mercury-coder",
                  choices = {
                    "inception/mercury-coder",
                  },
                },
              },
            })
          end,
        },
      },
      interactions = {
        inline = {
          adapter = "openrouter",
          keymaps = {
            accept_change = {
              modes = { n = "<LocalLeader>cc" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "<LocalLeader>cr" },
              description = "Reject the suggested change",
            },
            always_accept = {
              modes = { n = "<LocalLeader>ca" },
              description = "Accept all suggested changes",
            },
          },
        },
      },
    })
    require("which-key").add({
      {
        "<LocalLeader>c",
        group = "CodeCompanion",
        icon = { icon = "󱜙", color = "blue" },
      }
    })
  end,
}
