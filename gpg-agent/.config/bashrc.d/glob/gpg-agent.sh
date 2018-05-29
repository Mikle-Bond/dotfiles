# GPG-agent needs GPG_TTY variable uadated in each new shell.
# This is explicitly stated in gpg-ageng(1) manpage
# TODO: this probably means, it should be done in non-interactive shell as well.
export GPG_TTY=$(tty)

