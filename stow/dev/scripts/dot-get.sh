#!/bin/bash

get_norm_name() {
	local file="$1"
	local dir="$(dirname "$file")"
	echo "$(cd "$dir" && pwd)/$(basename "$file")"
}

show_help() { cat <<EOL
Package file obtainer dot-get.sh
USAGE
	dot-get.sh pkg-name NAME
	
	pkg-name  -- name of stow package (folder under ~/.dotfiles/)
	NAME      -- any file under ~/

This script checks whether file or directory is owned by stow, and if not,
it is moved under pkg-name and replaced with according symlink.
EOL
}

main() {
	if [[ $# -ne 2 ]]; then
		show_help >&2
		exit 1
	fi
	local package="$1"
	local file="$2"

	local pkghome="$HOME/.dotfiles"
	local pkg="$pkghome/$package"

	local homed="$(get_norm_name "$file")"
	local common="${homed#$HOME/}"

	if [[ $homed == $common ]]; then
		echo "File '$homed' is not under '$HOME'"
		exit 3
	fi
	if [[ $homed =~ ^$pkghome ]]; then
		echo "File '$homed' is under '$pkghome'"
		exit 4
	fi

	local stowd="$pkg/$common"

	echo "Original: '$homed'"
	echo "Packaged: '$stowd'"

	local real="$(realpath "$file")"
	if [[ $real =~ ^"$pkghome" ]]; then
		package="${real#$pkghome/}"
		package="${package%%/*}"
		echo "File '$homed' is actually a '$real' thuth it belongs to package '${package}'"
		exit 2
	fi

	mkdir -vp "$(dirname "$stowd")"
	mv -vi "$homed" "$stowd" && ln -vs "$stowd" "$homed"
}

main "$@"

