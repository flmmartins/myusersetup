# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="nanda"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

#FUNCTIONS
function vsphere {
  cd $HOME/dev/vsphere
}

function levelup {
   cd $HOME/dev/level-up
}

function gap {
  cd $HOME/dev/dhcp_reserve
}

function enc {
  cd /Users/fmartins/dev/key-recovery-app-encrypter
}

function dec {
  cd /Users/fmartins/dev/key-recovery-app-decrypter
}

#JAVA HOME
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#PATH
PATH=${PATH}:${JAVA_HOME}/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/sbin
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/usr/local/git/bin
PATH=${PATH}:$HOME/.rvm/bin
PATH=${PATH}:$HOME/packer
PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/9.3/bin
PATH=${PATH}:$HOME/.jenv/bin

export PATH

#JENV SETUP
eval "$(jenv init -)"

#export PATH=/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$HOME/.rvm/bin:/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/bin

