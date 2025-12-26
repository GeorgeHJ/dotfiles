return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "onsails/lspkind.nvim",
    "kdheepak/cmp-latex-symbols",
    "jmbuhr/cmp-pandoc-references",
    "windwp/nvim-autopairs",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup({})

    -- Buffer source configuration
    local buffer_source = {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    }

    -- Common sources used in most configurations
    local common_sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      buffer_source,
    }
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = common_sources,
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "…",
          menu = {
            latex_symbols = "[  ]",
          },
        }),
      },
    })
    cmp.setup.filetype({ "markdown", "vimwiki" }, {
      sources = {
        { name = "latex_symbols" },
        unpack(common_sources),
      },
    })
    cmp.setup.filetype("sql", {
      sources = {
        { name = "vim-dadbod-completion" },
        unpack(common_sources),
      },
    })
    cmp.setup.filetype("quarto", {
      sources = {
        { name = "otter" },
        { name = "pandoc_references" },
        unpack(common_sources),
      },
    })
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
