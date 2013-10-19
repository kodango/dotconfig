#
# Kodango's ~/.bashrc
#

if [ -f "$HOME/.bashrc" ]; then
        . $HOME/.bashrc
fi

# Command alias
alias ls='ls -G'
alias ll='ls -lh'
alias diff='colordiff'
alias ..='cd ..'
alias ...='cd ../..'

export PS1='\n\[\e[0;36m\][\u@mac] \[\e[0;34m\]\w \n\[\e[0;36m\]\$ \[\e[0m\]'
export EDITOR='vim'

# Path
export PATH=/usr/local/bin/:$PATH

# Define ssh alias for server defined in ~/.ssh/config
for host in $(awk '/^Host/{if ($2!="*") print $2}' ~/.ssh/config); do
    alias $host="ssh $host"
done
[ -f ~/.markrc ] && source ~/.markrc
