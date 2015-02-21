# remaps
alias ls='ls --color=auto'
alias pushd='pushd .'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias pgrep='pgrep -l'
alias xclip='xclip -display :0'
alias du='du -h'
alias df='df -h'
alias dropbox="DISPLAY=:0 dropbox"

# short
alias l='env LC_ALL=C ls -lAXvhk --group-directories-first --color=auto'
alias o='xdg-open'
alias u='cd ..'
alias h='clear; cd'
alias r='clear; exec zsh'
alias rh='clear; cd; exec zsh'
alias s='sudo'
alias v='vim'
alias ex='vim -e'
alias cb='xclip -selection clipboard'
alias can='trash-put'

# new functions
alias lsmnt='mount | column -t'
alias vimcrypt='vim -u ~/.vimcrypt -x'
alias nettest='ping -c 5 8.8.8.8 && curl http://speedtest.dallas.linode.com/100MB-dallas.bin -m 5 > /dev/null'
alias netstop='sudo netctl stop-all'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias findn='noglob find . -name'
alias incognito='HISTFILE=/dev/null zsh'
function mcd() { md $1; cd $1 }

# error-correcting
alias :q='exit'
alias :wq='exit'

# global aliases
alias -g @tachyon=ryan@tachyon.zabcik.com
alias -g @pez=ryanz@pez.cs.utexas.edu
alias -g @hadron=ryan@hadron.zabcik.com
alias -g @nfs=rzabcik_zabcik@ssh.phx.nearlyfreespeech.net
