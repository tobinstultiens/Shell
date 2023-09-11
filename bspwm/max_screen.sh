#/bin/bash
windowwidth=2560
windowheight=1440

screenwidth=$(xdpyinfo | awk -F’[ x]+’ ‘/dimensions:/{print $3}’)
screenheight=$(xdpyinfo | awk -F’[ x]+’ ‘/dimensions:/{print $4}’)
windowx=$((“$screenwidth”/2-“$windowwidth”/2))
windowy=$((“$screenheight”/2-“$windowheight”/2))

bspc rule -a URxvt:urlpick state=floating rectangle=“$windowwidth”x”$windowheight”+”$windowx”+”$windowy” && urxvt -name vimfloat -e vim $@
