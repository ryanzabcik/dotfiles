if [[ -x "/usr/bin/pacman" ]] && [[ ! -e /tmp/okay-pacman-notify ]] && [[ ! -e /var/lib/pacman/db.lck ]]; then
    # one-line string containing all the updates availible
    pacman_updates_availible=$(cut -d " " -f 1 <(pacman -Qu) | tr "\n" " ")
    # enumerate the updates
    pacman_num_updates_availible=$(echo $pacman_updates_availible | wc -w)

    if [[ $pacman_num_updates_availible -gt 0 ]]; then
        if [[ $pacman_num_updates_availible -eq 1 ]]
            then pacman_updates_string="\e[1;33mThere is an update availible: $pacman_updates_availible"
            else pacman_updates_string="\e[1;33mThere are $pacman_num_updates_availible updates availible: $pacman_updates_availible"
        fi
    fi

    COLUMNS=$(tput cols)
    pacman_updates_string_wc=$(echo $pacman_updates_string | wc -w)
    # while the length of the update string is longer than columns:
    while [[ "${#pacman_updates_string}" -gt "$COLUMNS" ]]; do
        let pacman_updates_string_wc--
        pacman_updates_string=$(echo $pacman_updates_string | cut -d " " -f -$pacman_updates_string_wc) # cut off last word
        pacman_updates_string="$pacman_updates_string""..." # add an ellipsis to last word
    done
    [[ -n "$pacman_updates_string" ]] && echo -e $pacman_updates_string
fi
