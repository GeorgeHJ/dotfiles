return {
  filetypes = { "markdown", "quarto", "vimwiki" },
  settings = {
    ["harper-ls"] = {
      dialect = "British",
      markdown = {
        IgnoreLinkTitle = true,
      },
      userDictPath = vim.fn.stdpath("data") .. "/spell/en.utf-8.add",
    }
  }
}
