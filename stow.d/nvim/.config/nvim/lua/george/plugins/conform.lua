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
				default_format_opts = {
					lsp_format = "last"
				},
			}
		)
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end
}
