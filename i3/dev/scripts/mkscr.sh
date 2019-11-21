#!/bin/bash
# Places the screenshot to the /tmp folder, and links /tmp/sc__last to the fresh scrot.

# [[ -e /tmp/sc__last.png ]] && unlink /tmp/sc__last.png

# scrot $@ -e 'mv $f /tmp/sc_$f && ln -s /tmp/sc_$f /tmp/sc__last.png'

set -o errexit

# exe='maim'
exe='flameshot'

EXE_ARGS=()
file_path="/tmp"
file_latest="$file_path/${exe}_latest.png"
file_output="$file_path/${exe}_`date +%s`.png" 
do_fullscreen=false
do_clipboard=false
do_link=false
SCRIPT="$(basename $0)"

function fail() {
	show_help >&2
	exit 1
}

function show_help() {
cat <<END
Usage: $SCRIPT [OPTIONS]

Options:
  -f, --full        Capture fullscreen
  -c, --clip        Also copy to clipboard
  -l, --link        Create symbolic link to latest screenshot
  -e, --exe [EXE]   Use specific executable
                    (maim, flameshot)
  -h, --help        Print this help
END
}

function init_flameshot() {
	if [[ $do_fullscreen == true ]]; then
		ARGS+=('full')
	else
		ARGS+=('gui')
	fi

	# if [[ $do_clipboard == true ]]; then 
	#     ARGS+=('-c')
	# fi

	ARGS+=('-p' "$file_path")
}

function post_flameshot() {
	sleep 0.2
	file_output="$(ls -t $file_path/${exe}* | head -1)"
}

function init_maim() {
	ARGS+=('-k')

	if [[ $do_fullscreen == true ]]; then
		ARGS+=('-i' 'root')
	fi

	# QuickFix: compton blures anything, underneeth selection
	# wait 1 second until it's unblurred
	if pgrep -x compton &> /dev/null ; then
		ARGS+=('-d' '1')
	fi

	ARGS+=("$file_output")
}

function post_maim() {
	:
}

main() {
	local -r s_opts="hfce:l"
	local -r l_opst="help,full,copy,exe:,link"
	
	TEMP=$(getopt -n "$SCRIPT" -o $s_opts -l $l_opst -- "$@")
	[ $? -eq 0 ] || fail

	eval set -- "$TEMP"

	while [ "--" != "$1" ] ; do
		case "$1" in
			-f|--full) do_fullscreen=true ;;
			-c|--clip) do_clipboard=true ;;
			-l|--link) do_link=true ;;
			-h|--help)
				show_help
				exit 0 
				;;
			*) echo "unimplemented option: $1" ;; 
		esac
		shift
	done

	shift # --

	eval init_$exe
	$exe "${ARGS[@]}"
	eval post_$exe

	# Copy to clipboard
	if [[ $do_clipboard == true ]]; then 
		cat "$file_output" | xclip -sel clip -t image/png
	fi

	# Relinking latest screenshot
	if [[ $do_link == true ]]; then
		[ -L $file_latest ] && unlink $file_latest
		ln -s $file_output $file_latest
	fi
}

main "$@"

# vim: ts=4:sw=4:
