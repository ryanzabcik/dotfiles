local dir=$(dirname $0)
source "$dir/kernel-updates.zsh"
source "$dir/package-updates.zsh"

# Use this function to quell notifications until next boot or 24 hours.
function okay {
    touch /tmp/okay-pacman-notify
    which at && at now + 24 hours <<<"rm /tmp/okay-pacman-notify"
    clear
}

# This one won't be deleted in 24 hours.
function okay! {
    touch /tmp/okay-pacman-notify
    clear
}
