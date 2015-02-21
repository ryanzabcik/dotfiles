# Make netctl(1) a little friendlier
function netctl_wrapper() {
    local -a netctl
    netctl=(sudo netctl)
    local current=$($netctl list | grep '*' | cut -c 3-)
    if [[ -z $1 ]] || [[ $1 == l* ]]; then
        $netctl list
    elif [[ $1 == stop ]]; then
        if [[ -z $2 ]]; then
            $netctl stop-all
        else
            $netctl stop $2
        fi
    elif [[ $1 == restart ]] || [[ $1 == status ]]; then
        $netctl $1 $current
    else
        $netctl $@
    fi
}

# optional shorthand aliases
alias net=netctl_wrapper # net(8) is already a program if you have samba installed; type \net to use it
alias n=netctl_wrapper
