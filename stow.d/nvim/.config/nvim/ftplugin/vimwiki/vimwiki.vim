scriptencoding utf-8
setlocal wrap linebreak nolist
setlocal formatoptions-=l
setlocal foldlevel=4
setlocal textwidth=80
map <leader>bl :VimwikiBacklinks<CR>

" mardown reflinks
augroup md_reflinks
	autocmd!
	autocmd BufWrite *.md  if exists('b:vimwiki_base_dir') | call vimwiki#markdown_base#scan_reflinks()
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
