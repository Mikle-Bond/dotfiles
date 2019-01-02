#!/bin/bash

file=$(mktemp --suffix='.png')
trap "rm $file" 0 1 2 3 15

if [ -z ${QUTE_URL+set} ] ; then 
	QUTE_URL="$1"
fi

qrencode -s 15 -t PNG -o "$file" "$QUTE_URL"
sxiv -s f $file

