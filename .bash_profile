# Read bashrc for Mac
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

# Add node to $PATH
export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#for Ruby on Rails(rbenv)
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null;
    then eval "$(rbenv init -)";
fi
