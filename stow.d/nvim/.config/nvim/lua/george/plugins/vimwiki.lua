return {
  "vimwiki/vimwiki",
  event = "VeryLazy",
  ft = "markdown",
  cmd = {
    "VimwikiIndex",
    "VimwikiDiaryIndex",
    "VimwikiMakeDiaryNote",
    "VimwikiYesterdayDiaryNote",
    "VimwikiTomorrowDiaryNote",
  },
  init = function()
    vim.g.vimwiki_ext2syntax = {
      [".md"] = "markdown",
      [".markdown"] = "markdown",
      [".mdown"] = "markdown",
    }
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_auto_chdir = 1
    vim.treesitter.language.register("markdown", "vimwiki")
    vim.g.vimwiki_list = {
      {
        name = "Notes",
        path = "~/Documents/Notes/",
        index = "index",
        ext = ".md",
        syntax = "markdown",
        auto_diary_index = 1,
        diary_caption_level = -1,
        links_space_char = "_",
        auto_tags = 1,
      },
    }

    local diary_augroup = vim.api.nvim_create_augroup("VimWikiDiary", { clear = true })
    vim.api.nvim_create_autocmd("BufNewFile", {
      pattern = vim.fn.expand("~") .. "/Documents/Notes/diary/*",
      group = diary_augroup,
      callback = function()
        vim.cmd([[read !fortune|sed -e 's/\(^\)/\1> /']])
        vim.cmd([[g/^$/d]])
        vim.cmd([[norm G2o]])
      end,
    })
  end,
}
