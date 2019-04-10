#!/bin/bash

shopt -s extglob
shopt -o pipefail

if [ -z ${QUTE_URL+set} ] ; then
	QUTE_URL="$1"
fi

copy_url=false
nurun=false

# The current target page to resolve
URL="$QUTE_URL"
# Possible redirections
TARGETS=()

# Debugging utilities
function dbg() { echo "DEBUG: $*" >&2 ; }
function ns() { notify-send "mpv.sh" "${*//&/&amp;}" ; }
function fail() { echo "$@" >&2 ; exit 1 ; }

# Fetch url by selector
function pup_url() {
	local url="$1"
	local selector="${*:2}"

	dbg "url = $url, selector = $selector"

	wget -qO - "$url" | pup -p "$selector"
}

#==========================================================
# Handlers

function handle_sa_url() {
	#-------------------BROKEN--------------------#
	# But kinda pruf of concept.

	link_array=(
		$( pup_url "$URL" 'div.m-translation-view-download > a attr{href}' )
	)
	set -- "${link_array[@]}"

	[[ "$1" =~ 1080$ ]] && shift

	local vid_url="$1"
	local sub_url="${!#}"

	exec mpv --profile=low-latency --video-sync=display-adrop --sub-file="$sub_url" "$vid_url" # --cache=16384 --profile=low-latency
}

handle_shikimori() {
	local url="${URL%/}"

	if [[ "$url" =~ ^.*video_online/[^/]*$ ]] ; then
		local html="$(pup_url "$url" 'div.video-variant-group[data-kind="subtitles"]')"
		local urls=( $(echo "$html" | pup -p "a attr{href}" ) )

		# local labels=( $(echo "$html" `
		#         `| pup -p "span.video-author text{}" `
		#         `| sed -ne 's/^\s*//;5~9{h};8~9{G;s/\n/ -- /;p}' ) )

		# HOLLY SH*T, JUST LOOK AT THIS: https://stackoverflow.com/questions/20157938/exit-code-of-variable-assignment-to-command-substitution-in-bash
		# Thank you, Adrian Günter)
		local choise
		choise=( $( echo "$html" `
			` | pup -p "a json{}" `
			` | jq -r 'map (.children | map({ (.class|scan("video[^ ]*")) : .text }) | add ) | '`
				 `'map("\(."video-hosting") -- \(."video-author" // "unknown")") | .[]' `
			` | tee /dev/stderr `
			` | rofi -dmenu -i -format i
		) ) || fail "No file chosen"
		TARGETS=( "${urls[$choise]}" )
	else
		TARGETS=( $(pup_url "$url" ".player-container .player-area > iframe attr{src}") )
	fi
}

handle_cartoonsub() {
	dbg "page address: $URL"

	# find inner iframe with video
	TARGETS=( $(pup_url "$URL" "div.contentVideo > p > iframe attr{src}") )
	TARGETS+=( $(pup_url "$URL" "div.contentVideo > script" | egrep -o 'https?://[^ "]+') )
}

handle_stormo_embed() {
	# find line in script, that loads video
	local vid=$( pup_url "$URL" 'script:contains("file:")' | grep 'file:' | tail -1 )
	# here, `tail -1` becouse others are for android and iOS, and url's are the same.
	dbg "script calls for files $vid"

	# extract urls
	TARGETS=( $(echo $vid | egrep -o 'https?://[^ ,?]+' | sed -r 's,/$,,; /low/d ') )
}

handle_dokpub() {
	TARGETS=( "${URL#*yandex/get/}" )
}

handle_sibnet_bad() {
	youtube-dl --quiet -o - `
	` --add-header 'Host: video.sibnet.ru' `
	` --add-header 'Accept: */*' `
	` --add-header 'Referer: '"$URL" `
	` --add-header 'User-Agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' `
	` --add-header 'Range: bytes=0-' `
	` "$URL" | mpv - || fail "something failed"
}

handle_sibnet() {
	local useragent='Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36'
	mpv '--ytdl-raw-options='`
		`'add-header="'"'"'Host: video.sibnet.ru'"'"'",'`
		`'add-header="'"'"'User-Agent: '"$useagent'"'",'`
		`'add-header="'"'"'Accept: */*'"'"'",'`
		`'add-header="'"'"'Referer: '"$URL'"'",'`
		`'add-header="'"'"'Range: bytes=0-'"'"'",'`
		`'verbose='` ` "$URL"
}

handle_default() {
	if (( copy_url == true )) ; then
		echo "$URL" | xclip -sel clip -i
	fi
	if (( norun == true )) ; then
		exec mpv "$URL"
		ns "spawning video failed\nurl = $URL"
	fi
}

rotator() {
	# This routine should find appropriate handler for URL.
	ns "got to rotator with url $URL"
	case "$URL" in
		*smotretanime.ru*)
			handle_sa_url ;;
		*play.shikimori.org*)
			handle_shikimori ;;
		*cartoonsub.com*)
			handle_cartoonsub ;;
		*stormo.tv/embed/*)
			handle_stormo_embed ;;
		*getfile.dokpub.com*)
			# handle_dokpub ;;
			handle_default ;;
		*sibnet.ru*)
			handle_sibnet_bad ;;
			# handle_default ;;
		*)
			handle_default ;;
	esac
}

chooser() {
	# When more than one url availible in TARGETS ask user to choose one.
	# Updates URL.
	local nr="${#TARGETS[@]}"
	if [ "$nr" -le 1 ] ; then
		URL="${TARGETS[0]}"
	else
		URL=$( printf "%s\n" "${TARGETS[@]}" | rofi -p "mpv.sh" -dmenu )
	fi
	TARGETS=()
	[[ "$URL" =~ ^//* ]] && URL="http:$URL"
}

main() {
	[[ "-c" =~ "$*" ]] && copy_url=true
	[[ "-n" =~ "$*" ]] && norun=true

	while [ -n "$URL" ] ; do
		rotator
		chooser
	done
}

main "$@"

exit 0

