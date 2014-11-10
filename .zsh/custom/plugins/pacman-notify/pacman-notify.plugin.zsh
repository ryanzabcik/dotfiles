source "$(dirname $0)/kernel-updates.zsh"
source "$(dirname $0)/package-updates.zsh"

# Use this function to quell notifications until next boot or 24 hours.
# If a second argument is given, interpret as time from now
function okay {
    touch /tmp/okay-pacman-notify
    if which at; then
        if [ "$*" ]; then
            at now + "$*" <<<"rm /tmp/okay-pacman-notify"
        else
            at now + 24 hours <<<"rm /tmp/okay-pacman-notify"
        fi
    else
        exit 1
    fi
    clear
}

# This one won't be deleted in 24 hours.
function okay! {
    touch /tmp/okay-pacman-notify
    clear
}
