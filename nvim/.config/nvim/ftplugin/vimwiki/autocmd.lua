local augroup = vim.api.nvim_create_augroup("md_reflinks", { clear = true })
vim.api.nvim_create_autocmd("BufWrite", {
  group = augroup,
  pattern = "*.md",
  callback = function()
    if vim.b.vimwiki_base_dir then
      vim.fn["vimwiki#markdown_base#scan_reflinks"]()
    end
  end,
})
