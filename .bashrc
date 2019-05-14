umask 022

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# alias
alias gis='git status'
alias gid='git diff'
alias gic='git checkout'
alias gib='git branch'
alias grep='grep --color=auto'
alias vtop="vtop --theme brew"
alias vi='vim -u NONE'
alias vim=nvim

# EDITOR
export EDITOR=nvim
#export EDITOR='env LANG=ja_JP.UTF-8 TERM=xterm-color TERMINFO=/usr/share/terminfo /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# neovim
export XDG_CONFIG_HOME=$HOME/.config

# IF Mac OSX
case $OSTYPE in
    darwin*)
        alias ls='ls -G'
        alias la='ls -la -G'
        ;;
    linux-gnu)
        alias ls='ls --color'
        alias la='ls -la --color'
        ;;
esac


# history
export HHISTSIZE=50000
export HHISTFILESIZE=50000
export HISTTIMEFORMAT='%Y/%m/%d %H:%M '
export HISTCONTROL=ignoreboth:erasedups       # ignoredups + ignorespace
export HISTIGNORE=la:ls:history:exit:?:??:??? # ignore ls, la, history, exit, 1-3 char command
bind "\C-n":history-search-forward
bind "\C-p":history-search-backward

# append to the history file, don't overwrite it
shopt -s histappend

# If use "!", Check command
shopt -s histverify

# color_prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
function facePrompt {
    if [ $? -eq 0 ]; then
        printf '\e[32m(*`･ω･)ゞ\e[m';
    else
        printf '\e[31m(´；Д；`)\e[m';
    fi;
}
PS1='\[\033[01;34m\]\w\[\033[00m\]: $(facePrompt) \$ '

# for phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# direnv
eval "$(direnv hook bash)"
