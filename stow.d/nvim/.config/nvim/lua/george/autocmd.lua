local fold_augroup = vim.api.nvim_create_augroup("folds", { clear = true })
-- Save folds on close
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	group = fold_augroup,
	desc = "save view (folds), when closing file",
	command = "mkview",
})

-- Load folds on open
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	group = fold_augroup,
	desc = "load view (folds), when opening file",
	command = "silent! loadview"
})

local nolist_augroup = vim.api.nvim_create_augroup("nolist", { clear = true })
-- Disable list mode for special buffer types
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",           -- quickfix/location list
		"help",         -- help pages
		"man",          -- man pages
		"lspinfo",      -- LSP info
		"checkhealth",  -- health check
		"TelescopePrompt",
		"NvimTree",
		"toggleterm",
	},
	group = nolist_augroup,
	callback = function()
		vim.opt_local.list = false
	end,
})
