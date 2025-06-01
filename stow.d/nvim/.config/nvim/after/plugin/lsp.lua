local on_attach = function(_, bufnr)
	local l = vim.lsp.buf
	local tb = require("telescope.builtin")
	local ta = require("tiny-code-action")
	local wk = require("which-key")

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		l.format()
	end, {})

	wk.add({
		{
			mode = { "n" },
			-- Normal mode mappings
			{ 'K',   l.hover,                 desc = "Hover",               buffer = bufnr },
			{ 'grn', l.rename,                desc = "Rename",              buffer = bufnr },
			-- Telescope integration mappings
			{ 'gd',  tb.lsp_definitions,      desc = "Go to Definition",    buffer = bufnr },
			{ 'gD',  tb.lsp_type_definitions, desc = "Go to Declation",     buffer = bufnr },
			{ 'grr', tb.lsp_references,       desc = "Find references",     buffer = bufnr },
			{ 'gri', tb.lsp_implementations,  desc = "Go to Implemenation", buffer = bufnr },
			{ 'gO',  tb.lsp_document_symbols, desc = "Document symbols",    buffer = bufnr }
		}, {
			-- Code actions
			mode = { "n", "v" },
			{ "gra", ta.code_action, desc = "Code Action", buffer = bufnr }
		}
	})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
				}
			},
			telemetry = { enable = false },
		},
	},
}
)
vim.lsp.enable("pylsp")
vim.lsp.config("pylsp", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pylsp_mypy = {
					enabled = true,
					live_mode = true,
					strict = true,
					dmypy = false
				},
				rope = {
					enabled = true,
					autoimport = {
						enabled = true
					}
				},
				isort = { enabled = false },
				ruff = { enabled = false },
				pylint = { enabled = false },
				pyflakes = { enabled = false },
				flake8 = { enabled = false },
				pycodestyle = { enabled = false },
			}
		}
	}
})
vim.lsp.enable("ruff")
vim.lsp.config("ruff", {
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		settings = {
			lint = {
				select = {
					"I", -- Import-related checks (isort)
					"E", -- pycodestyle errors
					"W", -- pycodestyle warnings
					"F", -- Pyflakes checks (error prevention)
					"B", -- flake8-bugbear best practices
					"ANN", -- Type annotations enforcement
					"D", -- Docstring conventions (PEP 257)
					"C4", -- Comprehensions
					"C90", -- mccabe
				}
			}
		}
	}
})
vim.lsp.enable("bashls")
vim.lsp.config("bashls", {
	on_attach = on_attach,
	capabilities = capabilities,
})
vim.lsp.enable("marksman")
vim.lsp.config("marksman", {
	on_attach = on_attach,
	capabilities = capabilities,
})
