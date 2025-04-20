local function nbufmap(keys, func, desc)
	vim.keymap.set('n', keys, func, { desc = desc })
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			}
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

			nbufmap('<leader>fg', project_files, "Find Project Files")
			nbufmap('<leader>ff', builtin.find_files, "Find Files")
			nbufmap('<leader>fr', builtin.live_grep, "Live Grep")
			nbufmap('<leader>fu', builtin.buffers, "Search Buffers")
			nbufmap('<leader>fm', builtin.man_pages, "Search Man Pages")
		end
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		config = function()
			require('tiny-code-action').setup()
			local action_opts = {}
			vim.keymap.set("n", "<leader>a", function()
				require("tiny-code-action").code_action(action_opts)
			end, { noremap = true, silent = true, desc = "Code Action" })
		end
	}
}
