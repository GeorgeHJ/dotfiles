return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
			local ft = require('Comment.ft')
			ft({'vimwiki','md'}, {'<!--\\ %s\\ -->', '<!--\\ %s\\ -->'})
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
		ft = "vifm",
		init = function()
			vim.g.vifm_exec = "TERM=libvterm-direct vifm"
		end
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
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		config = function()
			require("nvim-highlight-colors").setup()
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
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true
	},
	{}
}
