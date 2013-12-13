local dir=$(dirname $0)
source "$dir/kernel-updates.zsh"
source "$dir/package-updates.zsh"

# Use this function to quell notifications until next boot.
function okay {
    touch /tmp/okay-pacman-notify
    clear
}
