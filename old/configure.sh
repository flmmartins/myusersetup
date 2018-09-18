#!/bin/bash
OS=''
PACKAGE_MANAGER=''
VUNDLE_DIR=~/.vim/bundle/Vundle.vim
OHMYZSH_DIR=~/.oh-my-zsh

discover_os_and_pkg_manager () {
  OS_CMD=$(uname)
  case "$OS_CMD" in
    'Linux')
      OS=$(awk '{print $1}' /etc/issue)
      if [[ "$OS" == "Ubuntu" ]]; then
        PACKAGE_MANAGER="apt-get"
      else
        PACKAGE_MANAGER="yum"
      fi
      ;;
    'Darwin')
      OS='MAC'
      PACKAGE_MANAGER="brew"
      #TODO: Install brew
      ;;
    *)
      echo "---------------------------------"
      echo "Error"
      echo "---------------------------------"
      exit 1
      ;;
  esac
  echo "OS is $OS"
}

switch_caps_to_ctrl () {
  echo "---------------------------------"
  echo "Keyboard Configuration"
  echo "---------------------------------"
  case "$OS" in
    'Ubuntu')
      sudo mv /etc/default/keyboard /etc/default/keyboard.old
      sudo cp ./ubuntu_keyboard /etc/default/keyboard
      sudo /usr/bin/setxkbmap -option "caps:ctrl_modifier"
      ;;
    'MAC')
      ;;
    *)
      #TODO: Test in CentOS
      sudo xmodmap -e 'keycode 66 = Control_L'
      sudo xmodmap -e 'clear Lock'
      sudo xmodmap -e 'add Control = Control_L'
      xmodmap -pke | sudo tee -a ~/.Xmodmap
      sudo xmodmap .Xmodmap
      ;;
  esac
}

install_enpass_ubuntu () {
  echo "deb http://repo.sinew.in/ stable main" | sudo tee -a /etc/apt/sources.list.d/enpass.list > /dev/null
  wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install enpass  
}

install_enpass_redhat () {
  #TODO: Not tested
  wget https://dl.sinew.in/linux/setup/5-5-6/Enpass_Installer_5.5.6
  chmod +x EnpassInstaller
  sudo yum install libXScrnSaver lsof
  sudo ./EnpassInstaller
}

discover_os_and_pkg_manager
switch_caps_to_ctrl


echo "---------------------------------"
echo "Updating Package List"
echo "---------------------------------"
sudo $PACKAGE_MANAGER update

echo "---------------------------------"
echo "Installing Packages"
echo "---------------------------------"
sudo $PACKAGE_MANAGER install vim git curl wget flashplugin-installer wine dropbox chromium-browser shellcheck

if [ "$OS" == "Ubuntu" ]; then
  sudo $PACKAGE_MANAGER install guake playonlinux
  install_enpass_ubuntu
elif [ "$OS" == "MAC" ]; then
  echo "TODO: install brew packages for Mac"
else
  install_enpass_redhat
fi

echo "---------------------------------"
echo "Configuring Dotfiles"
echo "---------------------------------"
cp .gitconfig ~/.gitconfig
cp .vimrc ~/.vimrc

if [[ ! -d $VUNDLE_DIR ]]; then
  echo "---------------------------------"
  echo "Installing Vundle"
  echo "---------------------------------"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi

if [[ ! -d $OHMYZSH_DIR ]]; then
  echo "---------------------------------"
  echo "Installing Oh My ZSH"
  echo "---------------------------------"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "---------------------------------"
echo "Download Evernote Manually and run wine <installer>"
echo "---------------------------------"
