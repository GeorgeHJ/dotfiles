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

local function nbufmap(keys, func, desc)
	vim.keymap.set('n', keys, func, { desc = desc })
end

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

nbufmap('<leader>ff', project_files, "Find Files")
nbufmap('<leader>fr', builtin.live_grep, "Live Grep")
nbufmap('<leader>fu', builtin.buffers, "Search Buffers")
nbufmap('<leader>fm', builtin.man_pages, "Search Man Pages")
