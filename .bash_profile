# Read bashrc for Mac
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

#for Ruby on Rails(rbenv)
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null;
    then eval "$(rbenv init -)";
fi
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Add node to $PATH
export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# for nvm
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
cd() { builtin cd "$@"; 'load-nvmrc'; }
