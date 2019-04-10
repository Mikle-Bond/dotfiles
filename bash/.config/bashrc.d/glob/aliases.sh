# Depends on translate-shell
alias transe='trans en:ru'
alias transr='trans ru:en'
# TODO: make alias for Japaneese
alias say='trans -b -s en -speak -no-translate'

# One mistake tought me this is important
alias mv='mv -i'
alias rm='rm -i'

# Color support
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# Short-life pastebin
alias tb="nc termbin.com 9999" 

# Shortenings
alias ll='ls -la'
alias hw='ping 8.8.8.8'
alias hr="ping $(ip ro s default | awk '{print $3}')"

alias tomoji="docker run -i --rm rsimmons/tomoji" 

alias cat='bat'

# vim:ts=2:sw=2
