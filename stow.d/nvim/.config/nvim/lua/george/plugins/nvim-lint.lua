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
		vim.api.nvim_create_autocmd({ "BufReadPre", "BufWritePost", "TextChanged", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end
}
