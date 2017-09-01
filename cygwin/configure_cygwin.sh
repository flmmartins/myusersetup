#!/bin/bash

if [ ! -f "/bin/apt-cyg" ]; then
	echo "Installing apt-cyg"
	wget rawgit.com/transcode-open/apt-cyg/master/apt-cyg
	install apt-cyg /bin
	apt-cyg install vim curl zip unzip git zsh
fi

if [ ! -d "$HOME/.ssh" ]; then
	echo "SSH setup"
	mkdir -p $HOME/.ssh
	chmod 0700 $HOME/.ssh
	ssh-keygen -t rsa -b 4096 -C "flmmartins@gmail.com"
fi

if [ ! -f "/git-prompt.sh" ]; then
	wget -O /git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
