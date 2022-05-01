
"{{{ netrw — file explorer settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Toggle netrw
let g:NetrwIsOpen=0
function! ToggleNetrw()
	if g:NetrwIsOpen
		let i = bufnr('$')
		while (i >= 1)
			if (getbufvar(i, '&filetype') ==# 'netrw')
				silent exe 'bwipeout ' . i
			endif
			let i-=1
		endwhile
		let g:NetrwIsOpen=0
	else
		let g:NetrwIsOpen=1
		cd %:p:h
		silent Lexplore
	endif
endfunction

augroup CloseNetrw
	autocmd!
	autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q| endif
augroup END

"}}}
