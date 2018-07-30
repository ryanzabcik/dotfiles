# remaps
alias ls='gls -v --color=auto'
alias pushd='pushd .'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias pgrep='pgrep -l'
alias du='du -h'
alias df='df -h'
#alias dropbox="DISPLAY=:0 dropbox"
alias find='noglob find'
alias lsblk='lsblk -o MODEL,NAME,SIZE,MOUNTPOINT,LABEL,FSTYPE,UUID'

# short
alias l='env LC_ALL=C ls -lAXvhk --group-directories-first --color=auto'
alias o='xdg-open'
alias u='cd ..'
alias h='clear; cd'
alias r='clear; exec zsh'
alias rh='clear; cd; exec zsh'
alias y='yaourt --noconfirm'
alias p='sudo pacman --color auto'
alias s='sudo'
alias v='vim'
alias sys='sudo systemctl'
alias dl='cd /mnt/data0/Downloads'
alias db='cd /mnt/data0/Dropbox'
alias dt='cd /mnt/data0'
alias ex='vim -e'
alias cb='xclip -selection clipboard -display :1'
alias can='trash-put'

# new functions
alias lsmnt='mount | column -t'
alias upd='if [ "$(date +%u)" = 7 ]; then pacaur -Syua --devel ; sudo abs; else sudo pacman -Su; fi'
alias clearcache='paccache -r -k 3; rm -r $HOME/.cache/pacaur/'
alias vimcrypt='vim -u ~/.vimcrypt -x'
alias nettest='ping -c 5 8.8.8.8 && curl http://speedtest.dallas.linode.com/100MB-dallas.bin -m 5 > /dev/null'
alias pf8='sudo ping -f 8.8.8.8 -c 1000'
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
