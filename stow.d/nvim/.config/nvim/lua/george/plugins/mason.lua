return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"folke/neodev.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim"
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup(
			{
				ensure_installed = { "shfmt",
					"shellcheck",
					"ruff",
					"mypy" }
			}
		)
		require("mason-lspconfig").setup(
			{
				ensure_installed = { "lua_ls",
					"pylsp" }
			}
		)
	end
}
