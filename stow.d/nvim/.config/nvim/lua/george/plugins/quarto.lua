return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			'jmbuhr/otter.nvim',
			'hrsh7th/nvim-cmp',
			'neovim/nvim-lspconfig',
			'nvim-treesitter/nvim-treesitter'
		},
		filetype = "quarto",
		config = function()
			require("quarto").setup()
		end
	}
}
