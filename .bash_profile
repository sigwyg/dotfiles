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

# for use sbin
export PATH="/usr/local/sbin:$PATH"

# Add node to $PATH
export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# brew install pyenv pipenv
export PIPENV_VENV_IN_PROJECT=true
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
alias brew="env PATH=${PATH/\/Users\/sigwyg\/\.pyenv\/shims:/} brew"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# for nvim
export $(cat ~/dotfiles/.env | grep -v ^# | xargs)
