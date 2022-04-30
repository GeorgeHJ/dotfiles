if has('autocmd')
	augroup reddit
		autocmd!
		autocmd BufNewFile,BufRead /tmp/rtv_*.txt set filetype=markdown
	augroup END
endif
