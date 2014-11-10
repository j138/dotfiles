#!/bin/sh
DOTFILES=~/www/dotfiles
ln -s $DOTFILES/.vim ~/.vim


echo 'source ~/www/dotfiles/.vimrc' >> ~/.vimrc
echo 'source ~/www/dotfiles/.vimperatorrc' >> ~/.vimperatorrc
echo 'source ~/www/dotfiles/.zshrc' >> ~/.zshrc
echo 'source ~/www/dotfiles/.zshenv' >> ~/.zshenv
echo 'source-file ~/www/dotfiles/.tmux.conf' >> ~/.tmux.conf

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
git clone https://github.com/Shougo/vimproc.vim $DOTFILES/.vim/bundle/vimproc.vim

cd $DOTFILES/.vim/bundle/vimproc.vim/
make -f ./make_unix.mak

$DOTFILES/.vim/bundle/neobundle.vim/bin/neoinstall
