# XDG Workarounds for Vim, will conflict with Neovim, but I would only have one.
if [ -f "$XDG_CONFIG_HOME/vim/vimrc" ]; then
	#shellcheck disable=SC2016
	export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
	#shellcheck disable=SC2016
	export GVIMINIT='let $MYGVIMRC="$XDG_CONFIG_HOME/vim/gvimrc" | source $MYGVIMRC'
fi
