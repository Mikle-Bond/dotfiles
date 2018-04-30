#!/bin/bash

# This is for interactive shells only
[[ $- != *i* ]] && return

# if eval "[ -z \${MY_LOADED_$1+x} ]" ; then 
# if [ -z ${MY_BASHRC_LOADED+x} ] ; then

# Now my bashrc relies on this
#export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
# and now it is not

function chkload() { 
	[ -f "$1" ] && . "$1" 
}

function myfileload() { 
	# chkload "$XDG_CONFIG_HOME/bash/$1" 
	if test -d "$1"; then
		for script in $1/*.sh; do
			test -r "$script" && . "$script"
			# echo Loaded $script
		done
		unset script
	fi
}

config_dir="$XDG_CONFIG_HOME/bashrc.d"

# Sorce all standard aliases
myfileload "$config_dir/glob"

# Fetch those depending on graphical environment
if [ ! -z $DISPLAY ] ; then
	myfileload "$config_dir/graph"
fi

unset config_dir

# export GPG_TTY=$(tty)
# gpg-connect-agent updatestartuptty /bye >/dev/null

# vim:ts=2:sw=2

