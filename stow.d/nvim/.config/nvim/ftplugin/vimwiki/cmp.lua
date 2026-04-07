local cmp = require("cmp")

cmp.setup.buffer({
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.tbl_filter(function(buf)
            return vim.api.nvim_get_option_value("buflisted", { buf = buf })
          end, vim.api.nvim_list_bufs())
        end,
      },
    },
  },
})
