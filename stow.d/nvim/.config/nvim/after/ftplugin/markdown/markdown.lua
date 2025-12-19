vim.cmd([[
	setlocal wrap linebreak nolist
	setlocal formatoptions-=l
	setlocal foldlevel=4
	setlocal textwidth=80
	setlocal expandtab
	setlocal shiftwidth=2
	setlocal tabstop=2
	setlocal softtabstop=2
	nnoremap j gj
	nnoremap k gk
	setlocal commentstring=<!--%s-->
]])
