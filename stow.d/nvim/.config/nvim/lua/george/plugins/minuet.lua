-- Improved system prompt that doesn't fight against context
local better_system = {
  template = "{{{prompt}}}\n{{{guidelines}}}\n{{{n_completion_template}}}",
  prompt = [[
You are an AI code completion engine. Complete the code naturally and contextually.

Input format:
- <contextBeforeCursor>: Code before cursor
- <cursorPosition>: Where to complete
- <contextAfterCursor>: Code after cursor

Complete the code logically based on the surrounding context. Use the existing code structure, variable names, and patterns.]],
  guidelines = [[
Guidelines:
1. Complete code after <cursorPosition>
2. Maintain existing indentation and formatting exactly
3. Provide completions that fit naturally into the current function/context
4. Use variable names and patterns from the surrounding code
5. Return completions separated by <endCompletion>
6. Return code directly without markdown fences or explanations
7. Keep completions concise (1-5 lines typically)
8. Continue the logical flow of the current code block]],
  n_completion_template = "9. Provide at most %d completion items.",
}

return {
  "milanglacier/minuet-ai.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local config = require("minuet.config")
    local wk = require("which-key")
    require("minuet").setup({
      virtualtext = {
        keymap = {
          accept_line = "<A-l>",
          accept_word = "<A-w>",
          accept = "<A-Enter>",
          prev = "<A-[>",
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
      provider = "openai_compatible",
      provider_options = {
        claude = {
          system = better_system,
          chat_input = config.default_chat_input_prefix_first,
          few_shots = config.default_few_shots_prefix_first,
          stream = true,
          api_key = function()
            return vim.fn.system("pass show anthropic-coding"):gsub("\n", "")
          end,
        },
        openai_compatible = {
          name = "OpenRouter",
          model = "inception/mercury-coder",
          system = better_system,
          chat_input = config.default_chat_input_prefix_first,
          few_shots = config.default_few_shots_prefix_first,
          end_point = "https://openrouter.ai/api/v1/chat/completions",
          stream = true,
          api_key = function()
            return vim.fn.system("pass show openrouter-coding"):gsub("\n", "")
          end,
        },
      },
    })
    wk.add({
      mode = "n",
      { "<leader>om", "<cmd>Minuet virtualtext toggle<cr>", desc = "Toggle Minuet Virtual Text" },
    })
  end,
}
