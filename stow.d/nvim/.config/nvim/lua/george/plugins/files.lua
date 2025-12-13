return {
	{
		"vifm/vifm.vim",
		event = "VeryLazy",
		ft = "vifm",
		init = function()
			vim.g.vifm_exec = "TERM=libvterm-direct vifm"
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
}
