#/bin/bash
# mpc_watcher.sh
# This script should watch for the current playing song 
# and send signal of update to the i3Status. 

current_song=""
new_song=""

while :; do
	new_song="$(mpc current -f '[[%artist% -- ]%track%]|[%file%]')"
	if [ "${current_song}" != "${new_song}" ] ; then
		current_song="$new_song"
		# killall -SIGUSR1 i3status
		echo Song changed: $current_song
	fi
	sleep 1
done &


