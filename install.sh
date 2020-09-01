install(){
	yay -S scrot imagemagick i3lock sshfs --needed
}

if pacman -Qs yay > /dev/null ; then
	install
else
	sudo pacman -S yay
	install
fi
