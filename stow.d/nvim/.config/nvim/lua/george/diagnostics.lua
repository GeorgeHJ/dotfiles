-- Populate loclist with the current buffer diagnostics
vim.api.nvim_create_autocmd('DiagnosticChanged', {
	callback = function(args)
		vim.diagnostic.setloclist({ open = false })
	end,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
local severity = vim.diagnostic.severity
vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = signs.Error,
			[severity.WARN] = signs.Warn,
			[severity.HINT] = signs.Hint,
			[severity.INFO] = signs.Info
		},
		numhl = {
			[severity.ERROR] = "DiagnosticSignError",
			[severity.WARN] = "DiagnosticSignWarn",
			[severity.HINT] = "DiagnosticSignHint",
			[severity.INFO] = "DiagnosticSignInfo"
		},
		texthl = {
			[severity.ERROR] = "DiagnosticSignError",
			[severity.WARN] = "DiagnosticSignWarn",
			[severity.HINT] = "DiagnosticSignHint",
			[severity.INFO] = "DiagnosticSignInfo"
		}
	}
})
