function textify_delta_us() {
	local delta_us="$1"

	local us=$((delta_us % 1000))
	local ms=$(((delta_us / 1000) % 1000))
	local s=$(((delta_us / 1000000) % 60))
	local m=$(((delta_us / 60000000) % 60))
	local h=$((delta_us / 3600000000))

	local timer_show=""
	# Goal: always show around 3 digits of accuracy
	if   ((h > 0)); 		then timer_show=${h}h${m}m
	elif ((m > 0)); 		then timer_show=${m}m${s}s
	elif ((s >= 10)); 	then timer_show=${s}.$((ms / 100))s
	elif ((s > 0)); 		then timer_show=${s}.$(printf %03d $ms)s
	elif ((ms >= 100)); then timer_show=${ms}ms
	elif ((ms > 0)); 		then timer_show=${ms}.$((us / 100))ms
	else timer_show=${us}us
	fi

	echo "$timer_show"
}

export textify_delta_us

# vim:ts=2:sw=2
