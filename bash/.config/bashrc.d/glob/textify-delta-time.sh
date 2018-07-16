function c() {
	local value="$1"
	local postfix="$2"
	if ((value > 0)) ; then echo -n "$value $postfix " ; fi
}

function textify_delta_s() {
	local delta_s="$1"
	local s=$((delta_s % 60))
	local m=$(((delta_s / 60) % 60))
	local h=$(((delta_s / 3600) % 24))
	local d=$(((delta_s / 86400) % 365))
	local w=$(((delta_s / 604800) % 53))
	local y=$(((delta_s / 31536000)))

	c "$y" years
	c "$w" weeks
	c "$d" days
	c "$h" hours
	c "$m" min
	c "$s" sec
	echo ''
}

function textify_delta_us() {
	local delta_us="$1"

	local us=$((delta_us % 1000))
	local ms=$(((delta_us / 1000) % 1000))
	local delta_s=$((delta_us / 1000000))
	local s=$((delta_s % 60))
	local m=$((delta_s / 60))

	local timer_show=""
	# Goal: always show around 3 digits of accuracy
	if ((m > 0)); 			then timer_show=$(textify_delta_s $delta_s)
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
