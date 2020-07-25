#! /bin/sh
#
# ~/.profile
#
#

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim

[ -f "$HOME/.extend.profile" ] && . "$HOME/.extend.profile"

# $PATH variable
# Add user scripts directory
export PATH=$PATH:~/.bin
# Add $GOBIN to $PATH for go
if command -v go >/dev/null; then
	[ -d "$HOME/go" ] &&  export GOPATH="$HOME/go" &&
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
# Less — disable history file
export LESSHISTFILE="-"
# Readline
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
# Parallel
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
# Zsh
export ZDOTDIR=$HOME/.config/zsh
# Make xfce4-terminal the default terminal
export TERMINAL=xfce4-terminal
#Global alias file
[ -f "$XDG_CONFIG_HOME/shells/alias" ] && . "$XDG_CONFIG_HOME/shells/alias"
# Use vim as a man pager
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nonumber nomod nolist noma' -\""
# Set the configuration paths for lynx
export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"
export LYNX_LSS="$HOME/.config/lynx/lynx.lss"
# Quick Start Settings for Par
export PARINIT='rTbgqR B=.,?_A_a Q=_s>|'
# fzf options
export FZF_DEFAULT_OPTS="--color=16,fg+:14"
# IPython configuration directory
export IPYTHONDIR="$HOME/.config/ipython"
# Chromium BSU
export CHROMIUM_BSU_SCORE="$XDG_DATA_HOME/chromium-bsu/chromium-bsu-score"
export CHROMIUM_BSU_DATA="$XDG_DATA_HOME/chromium-bsu/chromium-bsu-data"
