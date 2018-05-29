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

xwinwrap -nf -fs -d -b -sp -ov -- \
	feh --randomize --bg-fill /home/mikle/.config/wallpapers/

