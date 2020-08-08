#! /data/data/com.termux/files/usr/bin/sh
# Fetch preferred font and use it for termux
main(){
	set-font
}

font() {
Url="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf"
File="JetBrains Mono Regular Nerd Font Complete.ttf"
Dest="$HOME/.termux/$File"
wget -O "$Dest" "$Url"
ln -s "$Dest" "$HOME/.termux/font.ttf"
}
main
