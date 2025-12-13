return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim"
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup(
			{
				ensure_installed = {
					"shfmt",
					"shellcheck",
					"ruff",
					"mypy",
					"markdownlint",
					"mdformat"
				}
			}
		)
		require("mason-lspconfig").setup(
			{
				ensure_installed = {
					"lua_ls",
					"pylsp",
					"bashls",
					"marksman",
					"basedpyright"
				},
				automatic_enable = false
			}
		)
	end
}
