#! /bin/sh
#
# ~/.profile
#
# shellcheck disable=1090

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim

[ -f "$HOME/.extend.profile" ] && . "$HOME/.extend.profile"

# $PATH variable
# Add user scripts directory
export PATH=${PATH}:"$HOME/.bin"
export PATH=${PATH}:"$HOME/.local/bin"
# Add $GOBIN to $PATH for go
export GOPATH="$HOME/.local/lib/go"
export GOBIN="$GOPATH/bin" &&
	export PATH=${PATH}:${GOBIN}

# XDG Base Directories
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-"$HOME/.cache"}
export XDG_DATA_HOME=${XDG_DATA_HOME:-"$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:-"$HOME/.local/state"}
export XDG_DESKTOP_DIR=${XDG_DESKTOP_DIR:-"$HOME/Desktop"}
export XDG_DOWNLOAD_DIR=${XDG_DOWNLOAD_DIR:-"$HOME/Downloads"}
export XDG_TEMPLATES_DIR=${XDG_TEMPLATES_DIR:-"$HOME/Templates"}
export XDG_DOCUMENTS_DIR=${XDG_DOCUMENTS_DIR:-"$HOME/Documents"}
export XDG_MUSIC_DIR=${XDG_MUSIC_DIR:-"$HOME/Music"}
export XDG_PICTURES_DIR=${XDG_PICTURES_DIR:-"$HOME/Pictures"}
export XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:-"$HOME/Videos"}

# Load profiles from ~/.config/profile.d
if test -d "$HOME/.config/profile.d"/; then
	for profile in "$HOME"/.config/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# TEXMF HOME Directory Settings for LaTeX
if [ -d ~/.texmf ]; then
	export TEXMFHOME=~/.texmf
elif [ -d "$XDG_DATA_HOME/texmf" ]; then
	export TEXMFHOME="$XDG_DATA_HOME/texmf"
fi

# Programs
# Cargo compiler for Rust
if command -v cargo >/dev/null 2>&1; then
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
if command -v lynx >/dev/null 2>&1; then
	export LYNX_CFG="$XDG_CONFIG_HOME/lynx/lynx.cfg"
	export LYNX_LSS="$XDG_CONFIG_HOME/lynx/lynx.lss"
fi
# Quick Start Settings for Par
export PARINIT='rTbgqR B=.,?_A_a Q=_s>|'
# fzf options
if command -v fzf >/dev/null 2>&1; then
	export FZF_DEFAULT_OPTS="--color=16,fg+:14"
fi
# IPython configuration directory
if command -v ipython >/dev/null 2>&1; then
	export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
fi
# Chromium BSU
if command -v chromium-bsu >/dev/null 2>&1; then
	export CHROMIUM_BSU_SCORE="$XDG_DATA_HOME/chromium-bsu/chromium-bsu-score"
	export CHROMIUM_BSU_DATA="$XDG_DATA_HOME/chromium-bsu/chromium-bsu-data"
fi
# GNUpg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
# GTK
readonly GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GTK2_RC_FILES
# ICEauthority
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
# Jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
# KDE
export KDEHOME="$XDG_CONFIG_HOME/kde"
# Mailcap (tuir)
if command -v tuir >/dev/null 2>&1; then
	export MAILCAPS="$XDG_CONFIG_HOME/tuir/mailcap"
fi
# MPV
if command -v mpv >/dev/null 2>&1; then
	export DVDCSS_CACHE="$XDG_CACHE_HOME/mpv/dvdcss"
fi
# Parallel
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
# PyEnv
export PYENV_ROOT="$HOME"/.local/lib/pyenv
# PyLint
if command -v pylint >/dev/null 2>&1; then
	export PYLINTHOME="$XDG_CONFIG_HOME/pylint.d/"
fi
if command -v mypy >/dev/null 2>&1; then
	export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/mypy
fi
# Sqlite
export SQLITE_HISTORY="$XDG_STATE_HOME"/sqlite/sqlite_history
# Terminfo
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

# Xorg
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
# Zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
# If using Nix/ home-manager
if command -v home-manager >/dev/null 2>&1; then
	. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi
# Rootless podman support for docker compose
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
