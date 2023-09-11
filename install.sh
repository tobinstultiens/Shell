declare -a scriptarray

install(){
	yay -S zsh flameshot scrot imagemagick sshfs cutycapt fzf npm lf python texlive-most zathura dragon-drag-and-drop spotify picom todoist polybar mailspring --needed
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
	scriptarray+=(voice/pulse-switch)
	scriptarray+=(games/steam-dmenu.py)
	scriptarray+=(nas/ConvertedHandbrake)
	scriptarray+=(games/runescape)
}

scripts(){
	for u in "${scriptarray[@]}"
	do
		location=$(readlink -f $u)
		file=$(echo $u | sed 's/.*\///')
		sudo ln -s $location /bin/$file
	done
}

wakeupscript(){
	sudo ln -s nas/WakeNas /etc/pm/sleep.d/WakeNas
}

#if pacman -Qs yay > /dev/null ; then
#	install
#else
#	sudo pacman -S yay
#	install
#fi
