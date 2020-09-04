declare -a scriptarray

install(){
	yay -S scrot imagemagick i3lock sshfs cutycapt fzf npm lf python texlive-most zathura dragon-drag-and-drop --needed
	pip install neovim
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	register
	scripts
}

register(){
	scriptarray+=(bookmarks/dmenu-bm)
	scriptarray+=(config/add-config)
	scriptarray+=(config/config-dmenu)
	scriptarray+=(i3/customi3lock)
}

scripts(){
	for u in "${scriptarray[@]}"
	do
		location=$(readlink -f $u)
		file=$(echo $u | sed 's/.*\///')
		sudo ln -s $location /bin/$file
	done
}

if pacman -Qs yay > /dev/null ; then
	install
else
	sudo pacman -S yay
	install
fi
