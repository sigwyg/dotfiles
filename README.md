##################
#
# dotfiles
#
##################

.vimrc, .vim, vim/bundles and others

1. cd ~/
2. git clone git://github.com/sigwyg/dotfiles.git 
3. ln -s dotfiles/.vimrc .vimrc
4. ln -s dotfiles/.vim .vim

5. cd dotfiles
6. mkdir .vim/swap
7. mkdir .vim/backup
8. mkdir .vim/autoload
9. git clone http://github.com/gmarik/vundle.git ~/dotfiles/.vim/vundle.git


Managed Vim-Plugins
--------------------------

See: [README.md](https://github.com/vim-scripts/vundle)

 * Search | :BundleSearch, :Bundles
 * Add    | :BundleInstall
 * Update | :BundleInstall!
 * Remove | :BundleClean


