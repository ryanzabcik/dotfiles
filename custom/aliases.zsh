# remaps
alias ls='ls --color=auto'
alias pushd='pushd .'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias wget='curl -O'

# short
alias l='env LC_ALL=C ls -lAXvhk --group-directories-first --color=auto'
alias o='xdg-open'
alias u='cd ..'
alias h='clear; cd; exec zsh'
alias r='clear; exec zsh'
alias y='yaourt --noconfirm'
alias p='sudo pacman --color auto'
alias s='sudo'
alias v='vim'
alias sys='sudo systemctl'

# new functions 
alias lsmnt='mount | column -t'
alias dl='cd /mnt/data0/Downloads'
alias db='builtin cd /mnt/data0/Dropbox'
alias randomport='random.org 49152 65535'
alias yupd='yaourt -Syua --devel --noconfirm'
alias upd='sudo pacman -Su'
alias vimcrypt='vim -u ~/.vimcrypt -x'
alias nettest='ping -c 5 utexas.edu && curl http://speedtest.dallas.linode.com/100MB-dallas.bin -m 10 > /dev/null'
alias netstop='sudo netctl stop-all'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias pez='ssh ryanz@pez.cs.utexas.edu'
alias nfs='ssh rzabcik_zabcik@ssh.phx.nearlyfreespeech.net'
alias backup='sudo rsync -aPAX --delete --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/lost+found} /* /media/backup'
alias hibernate='sudo /usr/lib/systemd/systemd-sleep hibernate'

# error-correcting
alias :q='exit'
alias :wq='exit'
