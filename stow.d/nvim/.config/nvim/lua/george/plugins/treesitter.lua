return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
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
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = {
							query = "@function.outer",
							desc = "Select outer function" },
						["if"] = {
							query = "@function.inner",
							desc = "Select inner function" },
						["ac"] = {
							query = "@class.outer",
							desc = "Select outer class" },
						["ic"] = {
							query = "@class.inner",
							desc = "Select inner class" },
						["al"] = {
							query = "@loop.outer",
							desc = "Select outer loop" },
						["il"] = {
							query = "@loop.inner",
							desc = "Select inner loop" },
					},
				}
			}
		}
	end
}
