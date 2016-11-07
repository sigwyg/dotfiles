umask 022

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# alias
alias gis='git status'
alias gid='git diff'
alias gic='git checkout'
alias gib='git branch'
alias grep='grep --color=auto'

# EDITOR
export EDITOR='env LANG=ja_JP.UTF-8 TERM=xterm-color TERMINFO=/usr/share/terminfo /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# IF Mac OSX
case $OSTYPE in
    darwin*)
        alias vi='env LANG=ja_JP.UTF-8 TERM=xterm-color TERMINFO=/usr/share/terminfo /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        alias vim='env LANG=ja_JP.UTF-8 TERM=xterm-color TERMINFO=/usr/share/terminfo /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        alias ls='ls -G'
        alias la='ls -la -G'
        ;;
    linux-gnu)
        alias ls='ls --color'
        alias la='ls -la --color'
        ;;
esac


# history
HISTSIZE=50000
HISTFILESIZE=50000
bind "\C-n":history-search-forward
bind "\C-p":history-search-backward

#ignorespace+ignoredups = ignoreboth
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# If use "!", Check command
shopt -s histverify

# color_prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
function facePrompt {
    if [ $? -eq 0 ]; then
        printf '\e[32m=͟͟͞͞ (\( ⁰⊖⁰)/)\e[m';
    else
        printf '\e[31m=͟͟͞͞ (\( >⊖<)/)\e[m';
    fi;
}
PS1='\[\033[01;34m\]\w\[\033[00m\]: $(facePrompt) \$ '

# node test
if [[ -f ~/.nvm/nvm.sh ]]; then
    source ~/.nvm/nvm.sh
fi
