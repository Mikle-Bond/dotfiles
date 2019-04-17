function chr() {
	[ "$1" -lt 256 ] || return 1
	printf "\\$(printf '%03o' "$1")"
}

function ord() {
	LC_CTYPE=C printf '%d' "'$1"
}

chrbin() {
	echo $(printf \\$(echo "obase=8; ibase=2; $1" | bc))
}

ordbin() {
	a=$(printf '%d' "'$1")
	echo "obase=2; $a" | bc
}

ascii2bin() {
	( 
		set -- "${1:-$(</dev/stdin)}" "${@:2}"
		echo -n $* 
	) | while IFS= read -r -n1 char ; do
		ordbin $char | tr -d '\n'
		echo -n " "
	done
	echo
}

bin2ascii() {
	( set -- "${1:-$(</dev/stdin)}" "${@:2}"
	echo '2i'
	for bin in $* ; do
		echo "$bin P"
	done ) | dc
	echo
}

