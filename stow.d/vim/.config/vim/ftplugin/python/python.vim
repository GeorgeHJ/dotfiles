" FtPlugin Settings for Python
" See also: ~/.config/vim/plugin/python.vim
"
" Python specific settings
map <LEADER>I :vertical terminal ++close ipython<CR>
map <LEADER>S :vertical terminal <CR>

" ALE Settings
let b:ale_fixers = ['autopep8', 'isort', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_python_pylsp_executable = 'pylsp'
let b:ale_linters = ['pylsp']
let b:ale_python_pylsp_config = { 'pylsp': {
			\     'plugins': {
			\       'flake8': {
			\         'enabled': v:true
			\       },
			\       'mypy': {
			\         'enabled': v:true
			\       },
			\       'pylint': {
			\         'enabled': v:false
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

