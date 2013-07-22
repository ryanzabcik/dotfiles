#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# variables
export LS_COLORS='di=1;34:fi=0:ln=36:pi=33:so=33:bd=33:cd=33:or=31:ex=32'
export EDITOR='vim'
export PAGER='most'
export PATH="/usr/bin:/home/ryan/scripts/:/opt/android-sdk/platform-tools"
if [[ "$TERM" == "xterm" ]]; then 
    export TERM="xterm-256color"
fi

if [ "$TERM" == screen ]; then
    export TERM="screen-256color"
fi

# external scripts
if [ -d "$HOME/.bash" ]; then
    for dotfile in $HOME/.bash/*
    do
        . $dotfile
    done
fi

# preferences
bind 'set completion-ignore-case on'
shopt -s dotglob
set -o vi
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
