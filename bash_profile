#
# Kodango's ~/.bash_profile
# 
# Version: 1.0
#

# Source the bashrc file too
if [ -f "$HOME/.bashrc" ]; then
    . $HOME/.bashrc
fi

# Source mark-directory tool config
[ -f "$HOME/.markrc" ] && source $HOME/.markrc

#
# Define aliases
#
alias ls='ls -G'
alias ll='ls -lh'
alias ..='cd ..'
alias ...='cd ../..'

if which colordiff &>/dev/null; then
    alias diff='colordiff'
fi

# Define ssh connection aliases for servers defined in ~/.ssh/config
for host in $(awk '/^Host/{if ($2!="*") print $2}' $HOME/.ssh/config); do
    alias $host="ssh $host"
done

#
# Define environment variables
#
export PS1='\n\[\e[0;36m\][\u@mac] \[\e[0;34m\]\w \n\[\e[0;36m\]\$ \[\e[0m\]'
export EDITOR='vim'
export PATH=/usr/local/bin:$PATH
export GOPATH=/Users/kodango/Documents/Github/mygo
