local on_attach = function(_, bufnr)
	local l = vim.lsp.buf
	local bo = vim.bo

	bo.omnifunc = "v:lua.vim.lsp.omnifunc"

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		l.format()
	end, {})

	local nbufmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- Leader mappings
	nbufmap('<leader>r', l.rename, "Rename")
	nbufmap('<leader>D', l.type_definition, "Type Definition")

	-- Normal mode mappings
	nbufmap('gd', l.definition, "Go to Definition")
	nbufmap('gD', l.declaration, "Go to Declation")
	nbufmap('gI', l.implementation, "Go to Implemenation")
	nbufmap('K', l.hover, "Hover")

	-- Telescope integration mappings
	nbufmap('gr', require('telescope.builtin').lsp_references, "Find references")
	nbufmap('<leader>s', require('telescope.builtin').lsp_document_symbols, "Document symbols")
	nbufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols, "Dynamic Workspace Symbols")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
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
