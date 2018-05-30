#!/usr/bin/env bash

DAEMONIZE=false
declare -a PROGRAM

if [ "$1" = '-d' ] ; then 
	DAEMONIZE=true
	shift
fi

case "$1" in
	htop) PROGRAM=(urxvt -name Htop -e htop) ;;
	log)  PROGRAM=(urxvt -name "Log screen" -e log_screen.sh) ;;
	spad) PROGRAM=(urxvt -name urxvtq -g 166x21+15+30) ;;
esac

function daemon() {
	cd /
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

