return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup(
			{
				formatters_by_ft = {
					sh = { "shfmt" },
					markdown = { "markdownlint", "trim_newlines", "trim_whitespace" },
					vimwiki = { "markdownlint", "trim_newlines", "trim_whitespace" },
				},
				default_format_opts = {
					lsp_format = "last"
				},
			}
		)
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end
}
