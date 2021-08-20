" General Settings
set tabstop=4
" ALE Settings
let b:ale_linters = ['gopls', 'gofmt', 'golint', 'govet', 'gobuild']
let b:ale_fixers = ['gofmt', 'goimports']
let b:ale_fix_on_save = 1
let b:ale_echo_msg_format = '%linter% | %severity% | %code: %%s'
let g:ale_set_balloons = 1

" vim-go settings
" Disabled as done by ALE
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0
" Extra highlights
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
