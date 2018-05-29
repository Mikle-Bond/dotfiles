export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

export HISTIGNORE="[ 	]*"
export EDITOR=vim

# The program wrappers
PATH="$HOME/bin:$PATH"
# The stuff I make
PATH="$PATH:$HOME/dev/scripts"
# The stuff I don't even remember what it does
PATH="$PATH:/home/mikle/.cargo/bin:$HOME/go/bin"

# git@github.com:medlefsen/std.sh.git
export STDSH_PATH="$HOME/git-repos/std.sh"
PATH="$PATH:$HOME/git-repos/std.sh/bin"

export PATH

# Ranger suggested to set it
export RANGER_LOAD_DEFAULT=FALSE

# DAMN, IT SHOULDN'T BE HERE
[ -f $HOME/.bashrc ] && source $HOME/.bashrc

# vim:ts=2:sw=2
