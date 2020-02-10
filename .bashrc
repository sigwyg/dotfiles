umask 022

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# alias
alias gis='git status'
alias gid='git diff'
alias gic='git checkout'
alias gib='git branch'
alias gim='git commit -m'
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

# auto "nvm use"
find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

cdnvm(){
    cd "$@";
    nvm_path=$(find-up .nvmrc | tr -d '[:space:]')

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        declare locally_resolved_nvm_version
        # `nvm ls` will check all locally-available versions
        # If there are multiple matching versions, take the latest one
        # Remove the `->` and `*` characters and spaces
        # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
        locally_resolved_nvm_version=$(nvm ls --no-colors $(<"./.nvmrc") | tail -1 | tr -d '\->*' | tr -d '[:space:]')

        # If it is not already installed, install it
        # `nvm install` will implicitly use the newly-installed version
        if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
            nvm install "$nvm_version";
        elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi
}
alias cd='cdnvm'
