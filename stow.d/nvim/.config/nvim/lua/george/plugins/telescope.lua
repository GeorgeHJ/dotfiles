return {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"rachartier/tiny-code-action.nvim",
			"folke/which-key.nvim"
		},
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
					}
				}
			})

			require("telescope").load_extension("fzf")
			local builtin = require("telescope.builtin")

			local is_inside_work_tree = {}

			local function project_files()
				local cwd = vim.fn.getcwd()

				if is_inside_work_tree[cwd] == nil then
					vim.fn.system("git rev-parse --is-inside-work-tree")
					is_inside_work_tree[cwd] = vim.v.shell_error == 0
				end

				if is_inside_work_tree[cwd] then
					builtin.git_files()
				else
					builtin.find_files()
				end
			end

		local wk = require("which-key")
		wk.add({
			{'<leader>f', group="Telescope", icon = {icon = "", color = "green"}},
			mode = { "n" },
			{ '<leader>fg', project_files, desc = "Find Project Files" },
			{ '<leader>ff', builtin.find_files, desc = "Find Files" },
			{ '<leader>fr', builtin.live_grep, desc = "Live Grep", icon = {icon = "", hl = "WhichKeyIconGreen"} },
			{ '<leader>fu', builtin.buffers, desc = "Search Buffers" },
			{ '<leader>fm', builtin.man_pages, desc = "Search Man Pages" }
		})
	end
}
