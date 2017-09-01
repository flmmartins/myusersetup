#!/bin/bash

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

if [ ! -d "$HOME/.ssh" ]; then
	echo "SSH setup"
	mkdir -p $HOME/.ssh
	chmod 0700 $HOME/.ssh
	ssh-keygen -t rsa -b 4096 -C "flmmartins@gmail.com"
fi

if [ ! -f "/git-prompt.sh" ]; then
	wget -O /git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
