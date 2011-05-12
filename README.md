
##################
#
# dotfiles
#
##################

.vimrc, .vim, vim/bundles and others

1. cd ~/
2. git clone git://github.com/sigwyg/dotfiles.git 
3. ln -s dotfiles/.vimrc .vimrc
   ln -s dotfiles/.vim .vim

   [Optional]
   ln -s dotfiles/.bashrc .bashrc
   ln -s dotfiles/.bash_profile .bash_profile

4. cd dotfiles
5. mkdir .vim/swap
   mkdir .vim/backup
   mkdir .vim/autoload
6. git clone http://github.com/gmarik/vundle.git ~/dotfiles/.vim/vundle.git


Managed Vim-Plugins
--------------------------

See [README.md](https://github.com/vim-scripts/vundle)

Search | :BundleSearch, :Bundles
Add    | :BundleInstall
Update | :BundleInstall!
Remove | :BundleClean


