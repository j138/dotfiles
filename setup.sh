#!/bin/sh
USER=$(id -u)
DOTFILES=$HOME/src/github.com/j138/dotfiles

mkdir -p "${HOME}"/{tmp,.cache,.config}
chown -R "${USER}" "${HOME}"/{tmp,.cache}

ln -s "${DOTFILES}" ~/.config

echo "$HOME/.config/nvim/init.vim" >> ~/.vimrc
echo "source-file $HOME/.tmux/main.conf" >> ~/.tmux.conf

export ZDOTDIR=~/src/github.com/.config/.zsh
echo "source $ZDOTDIR/.config/zsh/.zshenv" >> ~/.zshenv

git submodule foreach git pull
