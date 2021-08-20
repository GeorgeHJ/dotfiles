" Markdown Settings
augroup markdown
	autocmd!
	autocmd filetype markdown setlocal wrap linebreak
	autocmd filetype markdown map j gj
	autocmd filetype markdown map k gk
augroup END
let g:markdown_fenced_languages = ['sh', 'tex', 'vim']
let g:vim_markdown_folding_style_pythonic = 1
