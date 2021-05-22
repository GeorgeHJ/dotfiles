#! /bin/sh
#
# ~/.profile
#
# shellcheck disable=1090

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim

[ -f "$HOME/.extend.profile" ] && . "$HOME/.extend.profile"

# $PATH variable
# Add user scripts directory
export PATH=$PATH:~/.bin
export PATH=$PATH:~/.local/bin
# Add $GOBIN to $PATH for go
if command -v go >/dev/null; then
	if [ -d "$HOME/go" ]; then
		export GOPATH="$HOME/go"
	elif [ -d "$HOME/.local/lib/go" ];then
		export GOPATH="$HOME/.local/lib/go"
	fi
	export GOBIN="$GOPATH/bin" &&
		export PATH=$PATH:$GOBIN
fi

# XDG Base Directories
[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "$XDG_CACHE_HOME" ] && export XDG_CACHE_HOME="$HOME/.cache"
[ -z "$XDG_DATA_HOME" ] && export XDG_DATA_HOME="$HOME/.local/share"

# TEXMF HOME Directory Settings for LaTeX
if [ -d ~/.texmf ]; then
	export TEXMFHOME=~/.texmf
elif [ -d "$XDG_DATA_HOME/texmf" ]; then
	export TEXMFHOME="$XDG_DATA_HOME/texmf"
fi

# Programs
# Cargo compiler for Rust
if command -v cargo; then
		export CARGO_HOME="$XDG_DATA_HOME/cargo"
fi
# NPM
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# Less — disable history file
export LESSHISTFILE="-"
# Readline
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
# Parallel
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
# Pass
[ -d "$XDG_DATA_HOME/pass/password-store" ] && export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass/password-store"
# Make xfce4-terminal the default terminal
export TERMINAL=xfce4-terminal
#Global alias file
[ -f "$XDG_CONFIG_HOME/shells/alias" ] && . "$XDG_CONFIG_HOME/shells/alias"
# Use vim as a man pager
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nonumber nomod nolist noma' -\""
# Set the configuration paths for lynx
if command -v lynx; then 
		export LYNX_CFG="$XDG_CONFIG_HOME/lynx/lynx.cfg"
		export LYNX_LSS="$XDG_CONFIG_HOME/lynx/lynx.lss"
fi
# Quick Start Settings for Par
export PARINIT='rTbgqR B=.,?_A_a Q=_s>|'
# fzf options
if command -v fzf; then
		export FZF_DEFAULT_OPTS="--color=16,fg+:14"
fi
# IPython configuration directory
if command -v ipython; then
		export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
fi
# Chromium BSU
if command -v chromium-bsu; then
		export CHROMIUM_BSU_SCORE="$XDG_DATA_HOME/chromium-bsu/chromium-bsu-score"
		export CHROMIUM_BSU_DATA="$XDG_DATA_HOME/chromium-bsu/chromium-bsu-data"
fi
# Mailcap (tuir)
if command -v tuir; then
		export MAILCAPS="$XDG_CONFIG_HOME/tuir/mailcap"
fi
# MPV
if  command -v mpv ;then
		export DVDCSS_CACHE="$XDG_CACHE_HOME/mpv/dvdcss"
fi
# PyLint
if command -v pylint; then
		export PYLINTHOME="$XDG_CONFIG_HOME/pylint.d/"
fi
# Vim
if [ -f "$XDG_CONFIG_HOME/vim/vimrc" ];then
		#shellcheck disable=SC2016
	export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
		#shellcheck disable=SC2016
	export GVIMINIT='let $MYGVIMRC="$XDG_CONFIG_HOME/vim/gvimrc" | source $MYGVIMRC'
fi
# Zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
