#!/bin/bash
echo "Installing Vim and Git"
apt-get install vim git curl wget

echo "Configuring Git and Vim"
cp .gitconfig ~/.gitconfig
cp .vimrc ~/.vimrc

echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Installing Oh My ZSH"
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
