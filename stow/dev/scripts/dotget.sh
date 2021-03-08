#!/bin/bash

set -o pipefail
set -o errexit

get_norm_name() {
	local file="$1"
	local dir="$(dirname "$file")"
	echo "$(cd "$dir" && pwd)/$(basename "$file")"
}

show_help() { cat <<EOL
Package file obtainer dot-get.sh
USAGE
	dotget.sh pkg-name NAME
	
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

	local STOW_HOME="$HOME/.dotfiles"
	local pkg="$STOW_HOME/$package"

	local fpath_full="$(get_norm_name "$file")"
	local fpath_home="${fpath_full#$HOME/}"

	if [[ $fpath_full == $fpath_home ]]; then
		echo "File '$fpath_full' is not under '$HOME'"
		exit 3
	fi
	if [[ $fpath_full =~ ^$STOW_HOME ]]; then
		echo "File '$fpath_full' is under '$STOW_HOME'"
		exit 4
	fi

	local fpath_stow="$pkg/$fpath_home"

	echo "Original: '$fpath_full'"
	echo "Packaged: '$fpath_stow'"

	local real="$(realpath "$fpath_full")"
	if [[ $real =~ ^"$STOW_HOME" ]]; then
		package="${real#$STOW_HOME/}"
		package="${package%%/*}"
		echo "File '$fpath_full' is actually a link to '$real'"`
			`"thuth it belongs to package '${package}'"
		exit 2
	fi

	local relpath="$(realpath -m --relative-to="$(dirname "$fpath_full")" "$fpath_stow")"
	echo "Relative link: $relpath"

	mkdir -vp "$(dirname "$fpath_stow")"
	mv -vi "$fpath_full" "$fpath_stow" && ln -vs "$relpath" "$fpath_full"
}

main "$@"

