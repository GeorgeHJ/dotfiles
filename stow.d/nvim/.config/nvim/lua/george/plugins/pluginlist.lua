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
		event = "VeryLazy",
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
		event = "VeryLazy",
		ft = "vifm"
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
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"folke/which-key.nvim",
		dependencies = {
			{ "echasnovski/mini.nvim", version = false },
			"nvim-tree/nvim-web-devicons"
		},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end
	},
	{
		"preservim/vim-markdown",
		ft = "markdown",
		init = function()
			vim.g.vim_markdown_frontmatter = 1
			vim.g.vim_markdown_math = 1
			vim.g.vim_markdown_folding_disabled = 1
		end

	},
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		keys = "<leader>n",
		init = function()
			vim.g.loaded = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })
		end
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>cc", ":ColorizerToggle<CR>", { desc = "Toggle Colorizer" })
		end
	},
	{
		"romainl/vim-cool",
		event = "VeryLazy",
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
	{
		"tpope/vim-unimpaired",
		event = "VeryLazy",
	}
}
