#!/bin/bash
# vim: ts=4:sw=4:

eval `std.sh`
use args error argparse

EXCLUDE=(
	"shikimori.org" 
	"shikimori.one" 
	"shikimori.online" 
	"play.shikimori.org"
	"vk.com" 
	"music.yandex.ru" 
	"youtube.com"
	"www.youtube.com"
	"nyaa.si"
	"css-tricks.com"
	"codepen.io"
	"store.steampowered.com"
	"userstyles.org"
	"reddit.com"
	"learnrubythehardway.org"
	# "google.com"
	"googleusercontent.com"
	"pikabu.ru"
	"dotshare.it"
	"web.telegram.org"
	"terminal.sexy"
	"derpibooru.org"
)
PROTOCOLS=(
	"ftp://"
	"file://"
	"qute://"
	"chrome://"
	"about"
	"javascript"
	"data:text/html;"
)

use log
log_level warn
log_format() {
	@args t msg...
	echo "[$t]" "${msg[@]}" >&2
}
alias note='log note'
alias info='log info'
alias dbug='log debug'

function get_head() {
	@args name
	cat <<END
// ==UserScript==
// @name          $name
// @namespace     http://userstyles.org
// @author        Mikle_Bond
// @run-at        document-start
// @version       $(date +0.%Y%m%d%H%M%S)
// ==/UserScript==
(function() { var css = "";
END
}

get_ifexclude() {
	echo -n '  if(false || (new RegExp("^https?://(?!(forum.example.com'

	for i in "${EXCLUDE[@]}"; do
		echo -n "|([^/]+\.)?$i"
	done

	echo ')).*$")).test(document.location.href)'

	for i in "${PROTOCOLS[@]}"; do
		echo -n " || (document.location.href.indexOf(\"$i\") == 0)"
	done
	echo ')'
}

function get_css() {
	get_ifexclude # | sed -e 's/"/\\"/g'
	echo '    css += [ ""'
	sed -e 's/"/\\"/g;s/^/    ,"/;s/$/"/'
	echo '    ].join("\n");'
}

function get_tail() {
	cat <<END
/*
  if (typeof GM_addStyle != "undefined") {
    GM_addStyle(css);
  } else if (typeof PRO_addStyle != "undefined") {
    PRO_addStyle(css);
  } else if (typeof addStyle != "undefined") {
    addStyle(css);
  } else {
*/
    var heads = document.getElementsByTagName("head");
    if (heads.length > 0) {
      var node = document.createElement("style");
      node.type = "text/css";
      node.id = "qutebrowser-globaltheme"
      node.appendChild(document.createTextNode(css));
      heads[0].appendChild(node); 
    }
/*
  }
*/
})();
END
}

get_userjs() {
	@args name
	get_head "$name" 
	get_css
	get_tail 
}

get_usage() {
cat <<EOF
Description: convert CSS file into UserScript.

Usage:
	css2js [-v|-q] [-o OUTPUT] INPUT
	css2js -h
Parameters:
	-h, --help      print this help
	-v, --verbose   increase verbosity (up to 3 times)
	-q, --quiet     decrease verbosity
	-o, --output    output file; if none, then use 
	                file X.user.js for X.css input file

EOF
}

main() {
	local in out

	dbug "Starting parsing arguments"
	@argparse "css2js" "hvqo:" "help,verbose,quiet,output:"
	while [ ! "$1" = '--' ]; do
		case "$1" in
			-h|--help) 
				dbug "Getting some help"
				get_usage 
				exit 0
				;;
			-v|--verbose)  
				dbug "increasing verbosity"
				log_level $((_stdsh_LOG_LEVEL + 1))
				;;
			-q|--quiet)
				dbug "decreasing verbosity"
				log_level $((_stdsh_LOG_LEVEL - 1))
				;;
			-o|--output)
				shift
				out="$1"
				;;
		esac
		shift
	done 
	shift # --

	@require "Input files is not specified (use -h for help)." [ $# -ge 1 ]
	in="$1"
	@require "Input file is not valid css file!" [ -f "$in" ]

	if [[ -z "$out" ]] ; then
		dbug "Output file is assumed by substituting extention"
		out="${in%.css}.user.js"
	fi
	info "Using input file \"$in\" and output file \"$out\"."

	cat "$in" `
	`| sed -e 's_/\*.*\*/__;/^\s*$/d' `
	`| get_userjs "Global Dark Theme -- MyStyle" >"$out"
}

main "$@"

