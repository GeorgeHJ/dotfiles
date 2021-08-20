" Python specific settings
map <LEADER>I :vertical terminal ++close ipython<CR>
map <LEADER>S :vertical terminal <CR>

" ALE Settings
let b:ale_fixers = ['autopep8', 'isort', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_python_pylsp_executable = 'pyls'
let b:ale_linters = ['pylsp']
let b:ale_python_pylsp_config = { 'pylsp': {
			\     'plugins': {
			\       'flake8': {
			\         'enabled': v:true
			\       },
			\       'pylint': {
			\         'enabled': v:true
			\       },
			\       'pydocstyle': {
			\         'enabled': v:true
			\       },
			\       'pycodestyle': {
			\         'enabled': v:true
			\       }
			\     }
			\   },
			\ }

" Syntax settings
highlight pythonClassVar cterm=italic ctermfg=13 gui=italic guifg=#6c71c4
let g:python_highlight_file_headers_as_comments = 1
let g:python_highlight_all = 1
