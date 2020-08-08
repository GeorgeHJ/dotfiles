#! /data/data/com.termux/files/usr/bin/sh
# Fetch preferred font and use it for termux
	Url="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf"
	File="JetBrains Mono Regular Nerd Font Complete.ttf"
	Dest="$HOME/.termux/$File"

main() {
	sw_update
	get_pkgs
	if [ ! -f "$Dest" ]; then
	font
	fi
}

font() {
	wget -O "$Dest" "$Url"
	ln -s "$Dest" "$HOME/.termux/font.ttf"
}

sw_update() {
	apt update && apt-upgrade -y
}

get_pkgs() {
	apt install \
		wget \
		git \
		openssh \
		zsh \
		tergent \
		termux-api \
		vim
}
main
