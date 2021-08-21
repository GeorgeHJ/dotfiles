setlocal syntax=markdown
setlocal wrap linebreak nolist
setlocal formatoptions-=l
setlocal foldlevel=4
setlocal textwidth=100
map j gj
map k gk
let g:vim_markdown_fenced_languages = ['bash=sh', 'sh=sh', 'zsh=sh', 'tex', 'viml=vim']
let g:vim_markdown_folding_style_pythonic = 1

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
