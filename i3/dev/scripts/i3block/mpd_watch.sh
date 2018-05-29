#!/bin/bash

while :; do 
	pkill -RTMIN+11 i3blocks
	# sleep is needed to not update too often
	mpc idle > /dev/null 2>&1 || sleep 5
done &

wait

