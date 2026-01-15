local cmp = require("cmp")

cmp.setup.buffer({
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
  },
})
