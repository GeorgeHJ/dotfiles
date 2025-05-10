return {
	"williamboman/mason.nvim",
	version = "1.11.0",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", version= "1.32.0" },
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim"
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup(
			{
				ensure_installed = { "shfmt",
					"shellcheck",
					"ruff",
					"mypy",
					"bash-language-server"
				}
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
