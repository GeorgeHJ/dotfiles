return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept_line = "<END>",
          accept_word = "<C-M-l>",
        },
      },
      panel = { enabled = true },
    })
  end,
}
