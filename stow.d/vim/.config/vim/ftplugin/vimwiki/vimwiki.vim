scriptencoding utf-8
setlocal syntax=markdown
setlocal wrap linebreak nolist
setlocal formatoptions-=l
setlocal foldlevel=4
setlocal textwidth=80
map <leader>bl :VimwikiBacklinks<CR>

" mardown reflinks
augroup md_reflinks
		autocmd!
		autocmd BufWrite *.md call vimwiki#markdown_base#scan_reflinks()
augroup end

function! VimwikiLinkHandler(link)
		" Use Vim to open external files with the 'vfile:' scheme.  E.g.:
		"   1) [[vfile:~/Code/PythonProject/abc123.py]]
		"   2) [[vfile:./|Wiki Home]]
		let link = a:link
		if link =~# '^vfile:'
				let link = link[1:]
		else
				return 0
		endif
		let link_infos = vimwiki#base#resolve_link(link)
		if link_infos.filename ==? ''
				echomsg 'Vimwiki Error: Unable to resolve link!'
				return 0
		else
				exe 'tabnew ' . fnameescape(link_infos.filename)
				return 1
		endif
endfunction

" ALE Settings
let b:ale_enabled=0

" Appearance mods
" syntax match mkdListItem "^*" conceal cchar=•
syn match  mkdListItem                                 "^\s*[-*+]\s\+"                                                                       contains=mkdListTab,mkdListBullet2
syn match  mkdListItem                                 "^\s*\d\+\.\s\+"                                                                      contains=mkdListTab
syn match  mkdListTab                                  "^\s*\*"                                                                              contained contains=mkdListBullet1
syn match  mkdListBullet1                              "\*"                                                                                  contained conceal cchar=•
syn match  mkdListBullet2                              "[-*+]"                                                                               contained conceal cchar=•
" Markdown Fixes
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
