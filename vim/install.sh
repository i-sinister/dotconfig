#!/usr/bin/env bash
# install vim-plug
if [ ! -f ~/.config/vim/autoload/plug.vim ]; then
  curl -fLo ~/.config/vim/autoload/plug.vim \
     --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# use xdg as vimrc
if [ ! -L ~/.vim/tmp ]; then
	ln -s ~/.config/vim/xdg.vim ~/.vimrc
fi
