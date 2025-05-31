local tb = require("telescope.builtin")
local ta = require("tiny-code-action")
local wk = require("which-key")

local on_attach = function(_, bufnr)
	local l = vim.lsp.buf

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		l.format()
	end, {})

	local nbufmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- Normal mode mappings
	nbufmap('K', l.hover, "Hover")
	nbufmap('grn', l.rename, "Rename")

	-- Telescope integration mappings
	nbufmap('gd', tb.lsp_definitions, "Go to Definition")
	nbufmap('gD', tb.lsp_type_definitions, "Go to Declation")
	nbufmap('grr', tb.lsp_references, "Find references")
	nbufmap('gri', tb.lsp_implementations, "Go to Implemenation")
	nbufmap('gO', tb.lsp_document_symbols, "Document symbols")

	-- Code actions
	wk.add({
		mode = { "n", "v" },
		{ "gra", ta.code_action, desc = "Code Action", buffer = bufnr }
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
vim.lsp.enable("marksman")
