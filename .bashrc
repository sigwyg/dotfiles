
umask 022

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# aliases
alias ls='ls -G'
alias la='ls -la -G'
alias gis='git status'
alias grep='grep --color=auto'

# history
HISTSIZE=50000
HISTFILESIZE=50000
bind "\C-n":history-search-forward
bind "\C-p":history-search-backward

# append to the history file, don't overwrite it
shopt -s histappend

# If use "!", Check command
shopt -s histverify

# color_prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '

