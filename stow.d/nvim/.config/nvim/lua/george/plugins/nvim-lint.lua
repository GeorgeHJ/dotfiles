return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile", "InsertLeave" },
	config = function()
		local lint = require("lint")
		vim.keymap.set("n", "<leader>l",
			function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		lint.linters_by_ft = {
			markdown = { "markdownlint" },
			vimwiki = { "markdownlint" }
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" },  {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end
}
