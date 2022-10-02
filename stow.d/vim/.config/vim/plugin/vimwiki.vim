" vimwiki with markdown support
" See also: ftplugin/vimwiki/vimwiki.md
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown','.mdown': 'markdown'}
let g:vimwiki_global_ext = 0
" helppage -> :h vimwiki-syntax
" folding settings:
let g:vimwiki_folding = 'expr'
let g:vimwiki_auto_chdir = 1
let g:vimwiki_filetypes = ['markdown']

" register my wiki on the vimwiki list
let notes = {}
let notes.name = 'Notes'
let notes.path = '~/Documents/Notes/'
let notes.index = 'index'
let notes.ext = '.md'
let notes.syntax = 'markdown'
let notes.auto_diary_index = 1
let notes.diary_caption_level=-1
let notes.links_space_char='_'
let notes.auto_tags =1
let python_notes = {}
let python_notes.name = 'Python'
let python_notes.path = '~/Documents/Notes/Python'
let python_notes.diary_rel_path = '../diary/'
let python_notes.index = 'index'
let python_notes.ext = '.md'
let python_notes.syntax = 'markdown'
let python_notes.auto_diary_index = 1
let python_notes.diary_caption_level=-1
let python_notes.links_space_char='_'
let python_notes.auto_tags =1
let g:vimwiki_list = [notes,python_notes]
" diary settings
if has('autocmd')
	augroup VimWikiDiary
		autocmd!
		autocmd BufNewFile ~/Documents/Notes/diary/* read !fortune|sed -e 's/\(^\)/\1> /'
		autocmd BufNewFile ~/Documents/Notes/diary/* :g/^$/d
		autocmd BufNewFile ~/Documents/Notes/diary/* :norm G2o
	augroup END
" templated notes
	augroup VimWikiNewNote
		autocmd!
		autocmd BufNewFile ~/Documents/Notes/[^\/]\+.md 0r ~/.config/vim/templates/note.md
		autocmd BufNewFile ~/Documents/Notes/Python/[^\/]\+.md 0r ~/.config/vim/templates/note.md
	augroup END
endif
