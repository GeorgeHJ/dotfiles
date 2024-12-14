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
		"vifm/vifm.vim",
		cmd = { "Vifm", "EditVifm", "Vifm", "PeditVifm", "SplitVifm", "VsplitVifm", "DiffVifm", "TabVifm" }
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
			"onsails/lspkind.nvim",
			"kdheepak/cmp-latex-symbols",
			"jmbuhr/cmp-pandoc-references"
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
		dependencies = {
			{"echasnovski/mini.nvim", version = false},
			"nvim-tree/nvim-web-devicons"
		},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end
	},
	{
		"preservim/vim-markdown",
		init = function()
			vim.g.vim_markdown_frontmatter = 1
			vim.g.vim_markdown_math = 1
			vim.g.vim_markdown_folding_disabled = 1
		end

	},
	"tpope/vim-fugitive",
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	},
	"lewis6991/gitsigns.nvim",
	{
		"nvim-tree/nvim-tree.lua",
		init = function()
			vim.g.loaded = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })
		end
	},
	"romainl/vim-cool",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
}
