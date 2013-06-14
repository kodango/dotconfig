#
# Kodango's ~/.bashrc
#
# Modified: 2013-06-14 11:15:00

if [ -f "$HOME/.bashrc" ]; then
    . $HOME/.bashrc
fi

# Command alias
alias ls='ls -G'
alias ll='ls -l'
alias diff='colordiff'
alias ..='cd ..'
alias ...='cd ../..'

# Appearance customization
# http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214
set t_Co=256
export CLICOLOR="xterm-color"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PS1='\n\[\e[1;32m\][\u@mac] \[\e[1;36m\]\w \n\[\e[0;32m\]\$ \[\e[0m\]'

# Path
export PATH=/usr/local/bin/:$PATH

# Define ssh alias for server defined in ~/.ssh/config
for host in $(awk '/^Host/{if ($2!="*") print $2}' ~/.ssh/config); do
    alias $host="ssh $host"
done
