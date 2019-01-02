function chr() {
	[ "$1" -lt 256 ] || return 1
	printf "\\$(printf '%03o' "$1")"
}

function ord() {
	LC_CTYPE=C printf '%d' "'$1"
}

chrbin() {
	echo $(printf \\$(echo "ibase=2; obase=8; $1" | bc))
}

ordbin() {
	a=$(printf '%d' "'$1")
	echo "obase=2; $a" | bc
}

ascii2bin() {
	( set -- "${1:-$(</dev/stdin)}" "${@:2}"
	echo -n $* ) | while IFS= read -r -n1 char ; do
		ordbin $char | tr -d '\n'
		echo -n " "
	done
	echo
}

bin2ascii() {
	( set -- "${1:-$(</dev/stdin)}" "${@:2}"
	echo -n $* ) | while read -r bin ; do
		# chrbin $bin | tr -d '\n'
		echo -n $bin
	done
	echo
}

