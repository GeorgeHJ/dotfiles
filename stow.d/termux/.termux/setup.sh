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
	get_zsh_plugins
}

font() {
	wget -O "$Dest" "$Url"
	ln -sf "$Dest" "$HOME/.termux/font.ttf"
}

sw_update() {
	apt update && apt upgrade -y
}

get_pkgs() {
	apt install \
		fzf \
		git \
		openssh \
		tergent \
		termux-api \
		tree \
		wget \
		vim \
		zsh
}

get_zsh_plugins(){
	git  clone 'https://github.com/romkatv/powerlevel10k' $HOME/.local/share/zsh/themes/powerlevel10k
git  clone 'https://github.com/zdharma/fast-syntax-highlighting' $HOME/.local/share/zsh/plugins/fast-syntax-highlighting
git  clone 'https://github.com/zsh-users/zsh-autosuggestions' $HOME/.local/share/zsh/plugins/zsh-autosuggestions
}
main
