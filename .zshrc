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
function vamosjuntas {
   cd $HOME/dev/vamosjuntas
}

#PATH
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:/usr/local/git/bin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/sbin
PATH=${PATH}:$HOME/.rvm/bin #Ruby Env
PATH=${PATH}:$HOME/packer
PATH=${PATH}:$HOME/.jenv/bin
PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/9.3/bin
#Did explore like this so Brew can overwrite apple dev tool
export PATH="/usr/local/bin:$PATH"

#Node Env
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#Autoload .nvmrc file from directories
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
      nvm use
    fi
}
add-zsh-hook chpwd load-nvmrc

#Groovy
GROOVY_HOME=/usr/local/opt/groovy/libexec

#Python Env
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)" #Enable virtualenv automatic activation

#Java Env
#To properly set JAVA_HOME run "jenv enable-plugin export" and restart
#Dont install it with brew, use github otherwise this will not work
eval "$(jenv init -)"
