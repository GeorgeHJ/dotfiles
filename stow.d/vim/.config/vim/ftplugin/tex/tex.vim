" LaTeX settings (originally in vimrc)
" For Vim-Latex-Suite Plugin
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" Compiler Target
let g:Tex_DefaultTargetFormat='pdf'
" Set Softwrap for LaTeX
autocmd FileType tex set wrap linebreak nolist
" Wrap at 120 columns for readability
autocmd FileType tex setlocal textwidth=120
