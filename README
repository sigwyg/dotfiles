
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
5. git submodule init
6. git submodule update

7. mkdir .vim/swap
   mkdir .vim/backup
   mkdir .vim/autoload
8. ln -s /Users/sigwyg/dotfiles/.vim/bundle/vim-pathogen/autoload/pathogen.vim /Users/sigwyg/dotfiles/.vim/autoload/pathogen.vim


Add modules
-----------------

git submodule add git://github.com/hail2u/vim-css3-syntax.git .vim/bundle/vim-css3-syntax


Remove modules
-----------------

1. .gitmodules
-[submodule ".vim/bundle/vim-css3-syntax.git"]
-       path = .vim/bundle/vim-css3-syntax.git
-       url = git://github.com/hail2u/vim-css3-syntax.git

2. .git/config
-[submodule ".vim/bundle/vim-css3-syntax.git"]
-       url = git://github.com/hail2u/vim-css3-syntax.git

3. git rm --cached .vim/bundle/vim-css3-syntax.git

