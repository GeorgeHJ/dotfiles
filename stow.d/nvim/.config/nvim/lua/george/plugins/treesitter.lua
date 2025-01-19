return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
				"vim",
				"vimdoc",
				"lua",
				"python",
				"bash",
				"latex",
				"markdown", "markdown_inline",
				"yaml"
			},
			sync_install = false,
			ignore_install = {},
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			modules = {},
		}
	end
}
