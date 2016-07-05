# Read bashrc for Mac
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

# for nvm
export NVM_DIR="$HOME/.nvm" . "$(brew --prefix nvm)/nvm.sh"

# for Ruby on Rails(rbenv)
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null;
    then eval "$(rbenv init -)";
fi
