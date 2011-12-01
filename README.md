##################
#
# dotfiles
#
##################

.vimrc, .vim, vim/bundles and others

1. $ cd ~/
2. $ git clone git://github.com/sigwyg/dotfiles.git 
3. $ ln -s dotfiles/.vimrc .vimrc
4. $ ln -s dotfiles/.vim .vim

5. $ cd dotfiles
6. $ mkdir .vim/swap
7. $ mkdir .vim/backup
8. $ mkdir .vim/autoload
9. $ git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim


Managed Vim-Plugins
--------------------------

See: [README.md](https://github.com/Shougo/neobundle.vim)

 * Update | :NeoBundleInstall!
 * Add    | :NeoBundleInstall
 * Remove | :NeoBundleClean


