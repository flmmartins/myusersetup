# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-4

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

# Enable proxy given a proxy address
PROXY_USER=""
PROXY_PWD=""
SSH_ENV="$HOME/.ssh/agent.env"

function enable_proxy {
	proxy_url="myproxy-url:port"
	echo "Activating proxy"
	echo -n "User:"
	read -s PROXY_USER
	printf "\n"
	echo -n "Password:"
	read -s PROXY_PWD
	printf "\n"
	proxy="http://${PROXY_USER}:${PROXY_PWD}@${proxy_url}"
	for env_var in {http,https,ssh,ftp}_proxy {HTTP,HTTPS,SSH,FTP}_PROXY
	do
		export "${env_var}"="${proxy}";
	done
	noproxy="localhost,127.0.0.1,.local,169.254/16"
	export NO_PROXY=$noproxy
	export PROXY_USER=${PROXY_USER}
	export PROXY_PWD=${PROXY_PWD}
	echo "Proxy and variables are set"
}


function disable_proxy {
	unset {http,https,ssh,ftp}_proxy {HTTP,HTTPS,SSH,FTP}_PROXY
	unset PROXY_USER
	unset PROXY_PWD
	echo "Proxy and variables are UNset"
}


function start_agent {
    echo "Initialising new SSH agent..."
    OLD_UMASK=$(umask 077)
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}" 
    umask ${OLD_UMASK}
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

function customize_prompt {
    #Solve cygwin breakline problem
    TERM=cygwin
    export TERM

    CYAN="\e[36m\]"
    YELLOW="\e[33m\]"

    source /git-prompt.sh
    export PS1="${WHITE}\W${YELLOW}\$(__git_ps1 ' (%s)')${WHITE}\$"
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWCOLORHINTS=1
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

customize_prompt
