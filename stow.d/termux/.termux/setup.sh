#! /data/data/com.termux/files/usr/bin/sh
# Fetch preferred font and use it for termux
Url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
File="JetBrainsMono.zip"
Dest="$HOME/.termux/$File"
Extract="$HOME/.termux/JetBrainsMonoNerdFont-Regular.ttf"

main() {
	sw_update
	get_pkgs
	if [ ! -f "$Dest" ]; then
		font
	fi
	bootstrap_zsh
	get_zsh_plugins
}

font() {
	wget -O "$Dest" "$Url" &&
	unzip "$Dest" "JetBrainsMonoNerdFont-Regular.ttf" && 
	ln -sf "$Extract" "$HOME/.termux/font.ttf" &&
	rm "$Dest"
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

bootstrap_zsh() {
	cat << EOF > /data/data/com.termux/files/usr/etc/zshenv
 
#! /bin/zsh

# look for zsh in .config or similar
if [[ -d \$XDG_CONFIG_HOME/zsh ]]
then
	zdotdir=\$XDG_CONFIG_HOME/zsh
elif [[ -d \$HOME/.config/zsh ]]
then
	zdotdir=\$HOME/.config/zsh
fi
EOF
}

get_zsh_plugins() {
	git clone 'https://github.com/romkatv/powerlevel10k' "$HOME/.local/share/zsh/themes/powerlevel10k"
	git clone 'https://github.com/zdharma/fast-syntax-highlighting' "$HOME/.local/share/zsh/plugins/fast-syntax-highlighting"
	git clone 'https://github.com/zsh-users/zsh-autosuggestions' "$HOME/.local/share/zsh/plugins/zsh-autosuggestions"
}
main
