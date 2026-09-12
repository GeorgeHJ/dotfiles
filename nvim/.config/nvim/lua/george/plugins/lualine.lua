local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    require("lualine").setup({
      icons_enabled = true,
      theme = "kanagawa",
      sections = {
        lualine_b = {'branch', { 'diff', source = diff_source }, 'diagnostics'},
        lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
      },
    })
  end,
}
