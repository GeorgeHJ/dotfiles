return {
  "hedyhli/outline.nvim",
  dependencies = { "onsails/lspkind.nvim" },
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>ol", ":Outline!<CR>", desc = "Toggle Outline" },
  },
  config = function()
    require("outline").setup({
      symbols = { icon_source = "lspkind" },
    })
    vim.keymap.set("n", "<leader>ol", ":Outline!<cr>", { noremap = true, silent = true, desc = "Toggle Outline" })
  end,
}
