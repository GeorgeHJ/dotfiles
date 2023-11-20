" diary settings
if has('autocmd')
	" augroup VimWikiDiary
	" 	autocmd!
	" 	autocmd BufNewFile ~/Documents/Notes/diary/* read !fortune|sed -e 's/\(^\)/\1> /'
	" 	autocmd BufNewFile ~/Documents/Notes/diary/* :g/^$/d
	" 	autocmd BufNewFile ~/Documents/Notes/diary/* :norm G2o
	" augroup END
" templated notes
	augroup VimWikiNewNote
		autocmd!
		autocmd BufNewFile ~/Documents/Notes/[^\/]\+.md 0r ~/.config/vim/templates/note.md
		autocmd BufNewFile ~/Documents/Notes/Python/[^\/]\+.md 0r ~/.config/vim/templates/note.md
	augroup END
endif
