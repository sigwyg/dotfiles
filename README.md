##################
#
# dotfiles
#
##################

.vimrc, .vim, vim/bundles and others

$ cd ~/
$ git clone git://github.com/sigwyg/dotfiles.git 
$ ln -s dotfiles/.vimrc .vimrc
$ ln -s dotfiles/.vim .vim

$ cd dotfiles
$ mkdir .vim/swap
$ mkdir .vim/backup
$ mkdir .vim/autoload
$ git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim


Managed Vim-Plugins
--------------------------

See: [README.md](https://github.com/Shougo/neobundle.vim)

 * Update | :NeoBundleInstall!
 * Add    | :NeoBundleInstall
 * Remove | :NeoBundleClean


