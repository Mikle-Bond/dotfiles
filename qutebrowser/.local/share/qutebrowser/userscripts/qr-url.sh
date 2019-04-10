#!/bin/bash

if [ -z ${QUTE_URL+set} ] ; then 
	QUTE_URL="$1"
fi

qrshare "$QUTE_URL"

