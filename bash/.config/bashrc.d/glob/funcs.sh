#!/bin/bash

function mkcdir() {
	if mkdir "$@" ; then 
		[[ "$1" == "-p" ]] && shift 
		cd "$@"
	fi
}
export mkcdir 

# vim:ts=2:sw=2
