return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup()
			vim.cmd("colorscheme kanagawa")
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("lualine").setup({
				icons_enabled = true,
				theme = 'kanagawa',
			})
		end
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
		}
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		}
	},
	"folke/neodev.nvim",
	{
		"preservim/vim-markdown",
		init = function()
			vim.g.vim_markdown_frontmatter=1
			vim.g.vim_markdown_math=1
		end

	},
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_ext2syntax = {
				[".md"] = 'markdown',
				['.markdown'] = 'markdown',
				['.mdown'] = 'markdown'
			}
			vim.g.vimwiki_global_ext = 0
			vim.g.vimwiki_auto_chdir = 1
			vim.g.vimwiki_filetypes = {"markdown"}
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
					auto_tags = 1
				},
			}
			vim.cmd(
				[[
				augroup VimWikiDiary
				autocmd!
					autocmd BufNewFile ~/Documents/Notes/diary/* read !fortune|sed -e 's/\(^\)/\1> /'
					autocmd BufNewFile ~/Documents/Notes/diary/* :g/^$/d
					autocmd BufNewFile ~/Documents/Notes/diary/* :norm G2o
				augroup END
				]])
		end,
	}
}
