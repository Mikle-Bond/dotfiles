#!/bin/bash

shopt -s extglob
shopt -o pipefail

if [ -z ${QUTE_URL+set} ] ; then 
	QUTE_URL="$1"
fi

copy_url=false
nurun=false

URL="$QUTE_URL"

function dbg() { echo "DEBUG: $*" >&2 ; }
function ns() { notify-send "mpv.sh" "${*//&/&amp;}" ; }

function pup_url() {
	local url="$1"
	local selector="${*:2}"

	dbg "url = $url, selector = $selector"
	
	wget -qO - "$url" | pup -p "$selector"
}

function handle_sa() {
	local sub_url="$1"
	local vid_url="$URL"

	exec mpv --v --profile=low-latency --video-sync=display-adrop --sub-file="$sub_url" "$vid_url" # --cache=16384 --profile=low-latency
	ns "spawning video from smotret-anime.ru failed\nnum = $number \nvideo is $vid_url"
}

function handle_sa_url() {
	# handles url to play page
	link_array=(
		$( pup_url "$URL" 'div.m-translation-view-download > a attr{href}' )
	)
	set -- "${link_array[@]}"
	
	[[ "$URL" =~ 1080$ ]] && shift
	
	local vid_url="$URL"
	local sub_url="${!#}"

	handle_sa "$vid_url" "$sub_url"
}

function handle_sa_num() {
	#-------------------BROKEN--------------------#
	local number="$1"

	local vid_url="http://smotret-anime.ru/translations/mp4/${number}?format=mp4"
	local sub_url="http://smotret-anime.ru/translations/ass/${number}?download=1"

	handle_sa "$vid_url" "$sub_url"
}


handle_shikimori() {
	#-------------------BROKEN--------------------#
	local url="$URL"
	
	url="${url%/}"
	if [[ "$url" =~ ^.*video_online/[^/]*$ ]] ; then 
		url=$( pup_url "$url" `
			`'.video-variant-group[data-kind="subtitles"] '`
			`'a.working:parent-of(span:contains("smotret-anime.ru")) '`
			`'attr{href}' | head -1
		)
		# ns "redirecting: url = $url"
	fi

	local vid_url=$(pup_url "$url" ".player-container .player-area > iframe attr{src}")
	local number="${vid_url##*/}"

	handle_sa_num "$number"
}

handle_cartoonsub() {
	dbg "page address: $URL"

	# find inner iframe with video
	URLS=( $(pup_url "$URL" "div.contentVideo > p > iframe attr{src}") )
	URLS+=( $(pup_url "$URL" "div.contentVideo > script" | egrep -o 'https?://[^ "]+') )
}

handle_stormo_embed() {
	# find line in script, that loads video
	local vid=$( pup_url "$URL" 'script:contains("file:")' | grep 'file:' | tail -1 )
	# here, `tail -1` becouse others are for android and iOS, and url's are the same.
	dbg "script calls for files $vid"

	# extract urls
	URLS=( $(echo $vid | egrep -o 'https?://[^ ,?]+' | sed -r 's,/$,,; /low/d ') )
}

handle_dokpub() {
	URLS=( "${URL#*yandex/get/}" )
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
		*smotret-anime.ru*) 
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
		*) 
			handle_default ;;
	esac
}

chooser() {
	# When more than one url availible ask user to choose one.
	# Updates URL.
	local nr="${#URLS[@]}"
	if [ "$nr" -le 1 ] ; then 
		URL="${URLS[0]}"
	else
		URL=$( printf "%s\n" "${URLS[@]}" | rofi -p "mpv.sh" -dmenu )
	fi
	URLS=()
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

