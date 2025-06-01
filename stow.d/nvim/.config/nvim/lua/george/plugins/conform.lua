local conform_opts = {
	lsp_fallback = true,
	async = false
}

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup(
			{
				formatters_by_ft = {
					sh = { "shfmt" },
					markdown = {"mdformat"},
					vimwiki = {"mdformat"},
				},
				conform_opts
			}
		)
		vim.api.nvim_create_user_command('Format', function(_)
			conform.format(
				conform_opts
			)
		end, {})
		vim.keymap.set({ "n", "v" }, "<leader>F", function()
			conform.format(conform_opts)
		end, { desc = "Format file or range (in visual mode)" })
	end
}
