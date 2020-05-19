#!/bin/bash

if [ ! -e 'setup.sh' ]; then
  touch ~/dotfiles/setup.sh
fi

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.tmux_conf ~/.tmux_conf
ln -sf ~/dotfiles/vim/plugin/ruby-matchit/plugin ~/.vim/
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
