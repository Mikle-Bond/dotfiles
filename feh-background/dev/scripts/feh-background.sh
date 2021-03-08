#/bin/bash

# cd ~/.config/wallpapers/
# if [ -L current.png ] ; then
	# name="$(find -type f| egrep -v "`readlink current.png`|current.png" | shuf -n1)"
	# ~/dev/scripts/mkfade.sh $name ./current.png
	# unlink ./current.png
	# ln -s $name ./current.png
# else
	# name="$(find -type f| shuf -n1)"
	# feh --bg-fill $name
# fi

feh_call=(feh --randomize --bg-max /home/mikle/.config/wallpapers/)

fallback() {
	"${feh_call[@]}"
	exit 0
}

if pgrep picom &> /dev/null ; then
	actwindow=$(xdotool getactivewindow 2> /dev/null )
	[[ -z $actwindow ]] && fallback
	(
		xwinwrap -nf -fs -d -b -sp -ov -- "${feh_call[@]}"
		xdotool windowactivate $actwindow
	) 2> /dev/null
	exit 0
fi

fallback

