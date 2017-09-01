#!/bin/bash
VUNDLE_DIR=~/.vim/bundle/Vundle.vim

copy_dotfiles () {
  src_file=$1
  dest_file=$(echo $src_file | cut -d '/' -f 2 )
	if [ ! -f "$HOME/$dest_file" ]; then
		echo "---------------------------------"
		echo "Copying dotfile $dest_file to HOME"
		echo "---------------------------------"
		cp $src_file $HOME/$dest_file
	fi
}

if [ ! -f "/bin/apt-cyg" ]; then
	echo "Installing apt-cyg"
	wget rawgit.com/transcode-open/apt-cyg/master/apt-cyg
	install apt-cyg /bin
fi

apt-cyg install wget vim curl zip unzip git

# Ansible Packages
apt-cyg install python python-paramiko python-crypto python-openssl python-setuptools python-devel nano openssh openssl openssl-devel gmp libgmp-devel make gcc-core

# Ansible Configuration for Cygwin
if [ ! -d "opt/ansible" ]; then
	easy_install-2.7 pip
	CFLAGS="-g -O2 -D_BSD_SOURCE" pip install -U pycrypto
	pip install ansible
fi

#Cygwin Prompt
if [ ! -f "/git-prompt.sh" ]; then
	wget -O /git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

if [ ! -d "$HOME/.ssh" ]; then
	echo "---------------------------------"
	echo "SSH setup"
	echo "---------------------------------"
	mkdir -p $HOME/.ssh
	chmod 0700 $HOME/.ssh
fi

copy_dotfiles .gitconfig
copy_dotfiles .vimrc
copy_dotfiles cygwin/.bash_profile

#Fix Solarize bug with Vundle
if [ ! -f $HOME/.vim/colors/solarized.vim ]; then
	echo "---------------------------------"
	echo "Solarize colorscheme setup"
	echo "---------------------------------"
  cp $HOME/.vim/bundle/vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors/
fi


if [[ ! -d $VUNDLE_DIR ]]; then
  echo "---------------------------------"
  echo "Installing Vundle"
  echo "---------------------------------"
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi
