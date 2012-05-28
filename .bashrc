
umask 022

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# alias
alias gis='git status'
alias gid='git diff'
alias grep='grep --color=auto'

# EDITOR
export EDITOR=/usr/bin/vim

# IF Mac OSX
if [[ "$OSTYPE" == "darwin10.0" ]]; then
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:"$HOME/.nvm/v0.6.18/bin/"
    
    alias vi=/usr/bin/vim
    alias vim='env LANG=ja_JP.UTF-8 TERM=xterm-color TERMINFO=/usr/share/terminfo /Applications/local/MacVim-kaoriya.app/Contents/MacOS/Vim "$@"'
    alias ls='ls -G'
    alias la='ls -la -G'
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls --color'
    alias la='ls -la --color'
else
    exit 1
fi


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
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# node test
if [[ -f ~/.nvm/nvm.sh ]]; then
    source ~/.nvm/nvm.sh
    nvm use v0.6.1
fi
. ~/.nvm/nvm.sh
