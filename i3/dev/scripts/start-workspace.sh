#!/usr/bin/env bash

declare -a PROGRAM

case "$1" in
	htop) PROGRAM=(urxvt -name Htop -e htop) ;;
	log)  PROGRAM=(urxvt -name "Log screen" -e log_screen.sh) ;;
	spad) PROGRAM=(urxvt -name urxvtq -g 166x21+15+30) ;;
esac

exec "${PROGRAM[@]}"

