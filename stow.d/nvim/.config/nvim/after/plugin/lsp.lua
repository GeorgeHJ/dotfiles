vim.api.nvim_create_augroup("LSP", { clear = true })
vim.api.nvim_create_autocmd({ "LspAttach" }, {
	group = "LSP",
	callback = function(args)
		local bufnr = args.buf
		local l = vim.lsp.buf
		local tb = require("telescope.builtin")
		local ta = require("tiny-code-action")
		local wk = require("which-key")

		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end

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
				{ 'gri', tb.lsp_implementations,  desc = "Go to Implementation", buffer = bufnr },
				{ 'gO',  tb.lsp_document_symbols, desc = "Document symbols",    buffer = bufnr }
			}, {
			-- Code actions
			mode = { "n", "v" },
			{ "gra", ta.code_action, desc = "Code Action", buffer = bufnr }
		}
		})
	end
}
)
vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	offset_encoding = "utf-8"
})

vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
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
vim.lsp.enable("basedpyright")
vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				diagnosticMode = "workspace",
				disableOrganizeImports = true,
				typeCheckingMode = "strict",
			}
		}
	}
})
vim.lsp.enable("ruff")
vim.lsp.config("ruff", {
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
vim.lsp.config("marksman", {
	filetypes = { "markdown", "vimwiki" },
})
