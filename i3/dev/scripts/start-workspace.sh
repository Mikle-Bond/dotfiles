#!/usr/bin/env bash

DAEMONIZE=false
declare -a PROGRAM

if [ "$1" = '-d' ] ; then 
	DAEMONIZE=true
	shift
fi

case "$1" in
	htop) 	PROGRAM=(urxvt -name Htop -e htop) ;;
	log) 	PROGRAM=(urxvt -name "Log screen" -e log_screen.sh) ;;
	scratch|scratchpad|spad|stash) 
		PROGRAM=(urxvt -name urxvtq -g 166x21+15+30 -e scratchpad) ;;
	*)
		echo "No, you want STASH!"
		echo "...or LOG, or HTOP..."
		exit 1
		;;
esac

function daemon() {
	cd ~
	exec 0<&-
	exec 1>/dev/null
	exec 2>/dev/null

	exec "$@"
}

if $DAEMONIZE ; then
	daemon "${PROGRAM[@]}" &
	disown
else
	exec "${PROGRAM[@]}"
fi

