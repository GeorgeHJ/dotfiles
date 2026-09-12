return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function ()
    local ls = require("luasnip")
    local from_lua = require("luasnip.loaders.from_lua")
    local from_vscode = require("luasnip.loaders.from_vscode")

    ls.config.setup({})
    ls.filetype_extend("vimwiki", {"markdown"})
    ls.filetype_extend("quarto", {"markdown"})

    from_vscode.lazy_load()
    from_lua.load(
      {
        paths = vim.fn.stdpath("config") .. "/snippets"
      }
    )
  end
}
