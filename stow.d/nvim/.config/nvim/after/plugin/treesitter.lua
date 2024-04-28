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
	-- incremental_selection = {
	-- 	enable = true,
	-- 	keymaps = {
	-- 		init_selection = "<CR>",
	-- 		node_incremental = "<CR>",
	-- 		scope_incremental = "<C-CR>",
	-- 		node_decremental = "<BS>",
	-- 	}
	-- }
}
