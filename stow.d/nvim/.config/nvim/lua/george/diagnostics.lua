-- Populate loclist with the current buffer diagnostics
vim.api.nvim_create_autocmd('DiagnosticChanged', {
	callback = function(args)
		local ft = vim.bo.ft
		if ft ~= "vimwiki" then
			vim.diagnostic.setloclist({ open = false })
		end
	end,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
local severity = vim.diagnostic.severity
local highlights = {
	[severity.ERROR] = "DiagnosticSignError",
	[severity.WARN] = "DiagnosticSignWarn",
	[severity.HINT] = "DiagnosticSignHint",
	[severity.INFO] = "DiagnosticSignInfo"
}
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[severity.ERROR] = signs.Error,
			[severity.WARN] = signs.Warn,
			[severity.HINT] = signs.Hint,
			[severity.INFO] = signs.Info
		},
		numhl = highlights,
		texthl = highlights,
	}
})
