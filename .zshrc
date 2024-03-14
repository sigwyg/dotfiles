# direnv
eval "$(direnv hook zsh)"

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# for mise
eval "$(~/.local/bin/mise activate zsh)"

# prompt
# %~: 現在のディレクトリ（省略形）
# %#: super userなら#。それ以外は%
# %n: user
# %F: 色付け開始
# %f: 色付け終了
PS1='%F{cyan}%~:%f %# '

# alias
alias gis='git status'
alias gid='git diff'
alias gic='git checkout'
alias gib='git branch'
alias gip='git remote prune origin'
alias gibd="git branch --merged|egrep -v '\*|develop|master|main'|xargs git branch -d"
alias grep='grep --color=auto'
alias vtop="vtop --theme brew"
alias vi='vim -u NONE'
alias vim=nvim
alias lvim='~/.local/bin/lvim'

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 色を使用出来るようにする
autoload -Uz colors
colors

# lsに色を付けるエイリアス
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

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# [TAB] -> [TAB] でパス名の補完候補を選択
zstyle ':completion:*:default' menu select=1

# cd した先のディレクトリをディレクトリスタックに追加する
setopt auto_pushd
setopt pushd_ignore_dups

# コマンドのスペルを訂正する
setopt correct

# EDITOR
export EDITOR=nvim

# compsys
autoload -U compinit && compinit
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"

# for PHP
export LDFLAGS="-L/opt/homebrew/opt/php@8.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/php@8.1/include"


. /opt/homebrew/opt/asdf/libexec/asdf.sh
