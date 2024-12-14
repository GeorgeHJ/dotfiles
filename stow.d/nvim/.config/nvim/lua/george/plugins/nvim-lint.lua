return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		vim.keymap.set("n", "<leader>l",
			function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
	end
}
