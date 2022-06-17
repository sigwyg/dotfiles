# direnv
eval "$(direnv hook zsh)"

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# for nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

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
alias grep='grep --color=auto'
alias vtop="vtop --theme brew"
alias vi='vim -u NONE'
alias vim=nvim

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
