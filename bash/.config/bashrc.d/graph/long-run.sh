# long-run.sh
#
# Notifies about the task completed, if it was running for a long time.
# Depends on notify-send.
# 
# Credits to @NicolasThery at https://stackoverflow.com/a/34812608/9242144

function timer_now {
	date +%s%N
}

function timer_start {
	timer=${timer:-$(timer_now)}
}

function timer_stop {
	local delta_us=$((($(timer_now) - $timer) / 1000))
	unset timer

	local timer_show="$(textify_delta_us "$delta_us")"
	cmd="${cmd#*[0-9]*  }"

	if ((delta_us > 1000000)) ; then 
		case "$cmd" in 
			vim*|man*|ranger*) : ;;
			*) notify-send "Process done" "Execuded '$cmd' for $timer_show" ;;
		esac
	fi
}

if [ ! -z $DISPLAY ] ; then
	trap 'cmd="$( history 1)"; timer_start' DEBUG
	PROMPT_COMMAND=timer_stop
fi

# vim:ts=2:sw=2
