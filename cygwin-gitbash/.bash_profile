if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

enable_proxy () {
    if [[ $1 == "off" ]]; then
        unset {http,https,ssh,ftp}_proxy {HTTP,HTTPS,SSH,FTP}_PROXY
        echo -n "Proxy unset\n"
    else
	    for env_var in {http,https,ssh,ftp}_proxy {HTTP,HTTPS,SSH,FTP}_PROXY; do
		    export "${env_var}"="${PROXY}"
	    done
        noproxy="localhost,127.0.0.1,.local,169.254/16"
        export NO_PROXY=$noproxy
        echo "Proxy and variables are set"
    fi
}

gitproxy () {
  if [[ $1 == "off" ]]; then
    echo "Git proxy disabled"
    git config --global --unset http.proxy
    git config --global --unset https.proxy
  else
    echo "Git proxy enabled"
    git config --global http.proxy ${PROXY}
    git config --global https.proxy ${PROXY}
  fi
}

customize_prompt_for_cygwin () {
    #Solve cygwin breakline problem
    TERM=cygwin
    export TERM

    YELLOW="\[$(tput setaf 3)\]"
    GREEN="\[$(tput setaf 2)\]"
    RESET="\[$(tput sgr0)\]"

    source /git-prompt.sh
    #export PS1="\W\$(__git_ps1 \" ${YELLOW}(%s)${RESET}\") \$"
    export PS1="${RESET}\W\$(__git_ps1 \"${YELLOW}(%s)\")${GREEN}\$${RESET}"
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWCOLORHINTS=1
}

# ----------------------------------- FIRST LINES OF BASH_PROFILE ----------------------------------

#################
#VARIABLES
#################
#export GROOVY_HOME=$HOME/.sdkman/candidates/groovy/current/bin
#export PACKER_CONFIG=$HOME/.packerconfig

#################
#PROXY
#################
echo -n "User:"
read -s PROXY_USER
printf "\n"
echo -n "Password:"
read -s PROXY_PWD
printf "\n"
PROXY_URL="<SERVER>:<PORT>"
PROXY="http://${PROXY_USER}:${PROXY_PWD}@${PROXY_URL}"

#################
#SSH
#################
eval $(ssh-agent -s -t 28800)
ssh-add $HOME/.ssh/id_rsa

#################
#FUNCTIONS
#################
#customize_prompt_for_cygwin
enable_proxy
gitproxy