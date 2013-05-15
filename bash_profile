#
# Kodango's ~/.bashrc
#
# Modified: 2013-05-14 23:00:00

alias ls='ls -G'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias diff='colordiff'

# http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214
export CLICOLOR="xterm-color"
export LSCOLORS="gxfxcxdxbxegedabagacad"

export PS1='\n\[\e[1;32m\][\u@mac] \[\e[1;36m\]\w \n\[\e[0;32m\]\$ \[\e[0m\]'
set -o vi
