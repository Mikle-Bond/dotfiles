export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
# seems like I need it at least somewhere.
# TODO: consider moving it to environment.d
export XDG_DATA_HOME=${XDG_DATA_HOME:-${HOME}/.local/share}

export HISTIGNORE="[ 	]*"
export EDITOR=vim

# The program wrappers
PATH="$HOME/bin:$PATH"
# The stuff I make
PATH="$PATH:$HOME/dev/scripts"
# The stuff I don't even remember what it does
PATH="$PATH:/home/mikle/.cargo/bin:$HOME/go/bin"
# Ruby gems path 
export GEM_HOME=$HOME/.gem
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

# git@github.com:medlefsen/std.sh.git
export STDSH_PATH="$HOME/git-repos/std.sh"
PATH="$PATH:$HOME/git-repos/std.sh/bin"

export PATH

# Ranger suggested to set it
export RANGER_LOAD_DEFAULT=FALSE

# Set ssh-agent-related variables to use gpg-agent (picked from ArchWiki)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ] ; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# export MPD_HOST="$XDG_CONFIG_HOME/mpd/socket"
# Seems like idea of socket activation is a bad one...

# DAMN, IT SHOULDN'T BE HERE
[ -f $HOME/.bashrc ] && source $HOME/.bashrc

# vim:ts=2:sw=2
