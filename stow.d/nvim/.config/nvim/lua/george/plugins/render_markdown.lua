return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require("render-markdown").setup({
      file_types = { "markdown", "vimwiki" },
      bullet = { right_pad = 2 },
      checkbox = {
        unchecked = { icon = " " },
        checked = { icon = "󰄲 " },
        custom = {
          begun = { raw = "[.]", rendered = "󰄗 ", highlight = "Special" },
          progressed = { raw = "[o]", rendered = "󰡖 ", highlight = "Special" },
        },
      },
      heading = {
        custom = {
          date = {
            pattern = "^# %d%d%d%d%-%d%d%-%d%d",
            icon = " ",
            foreground = "RenderMarkdownDateH1",
            background = "RenderMarkdownDateH1",
          },
          time = {
            pattern = "^## %d%d%:%d%d",
            icon = " ",
            foreground = "Boolean",
            background = "Boolean",
          },
        },
      },
    })
    local custom_hl = function()
      local heading_color = "#7d9bd7"
      local heading_bg = "#242435"

      vim.api.nvim_set_hl(0, "RenderMarkdownDateH1", { fg = "#e06674", bold = true })
      for i = 1, 6 do
        -- Heading text
        vim.api.nvim_set_hl(0, "RenderMarkdownH" .. i, { fg = heading_color, bold = true })
        -- Headings with background
        vim.api.nvim_set_hl(0, "RenderMarkdownH" .. i .. "Bg", { fg = heading_color, bg = heading_bg, bold = true })
      end
    end
    custom_hl()

    local theme_augroup = vim.api.nvim_create_augroup("theme-tweaks", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      group = theme_augroup,
      callback = function()
        custom_hl()
      end,
    })
  end,
}
