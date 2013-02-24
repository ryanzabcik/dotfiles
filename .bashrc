#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# user-added functions
if [ -f "$HOME/.bash_functions" ]; then
    source "$HOME/.bash_functions"
fi

# variables

export LS_COLORS='di=1;34:fi=0:ln=36:pi=0:so=0:bd=0:cd=0:or=31:ex=32'
export EDITOR='vim'
if [[ "$TERM" == "xterm" ]]; then 
    export TERM="xterm-256color"
fi


# preferences
bind 'set completion-ignore-case on'

# aliases
if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# set the PS1 and the prompt_command
if [ -f "$HOME/.bash_prompt" ]; then
    source "$HOME/.bash_prompt"
fi

if [ -x "/usr/bin/pacman" ]; then
    # one-line string containing all the updates availible
    pacman_updates_availible=$(cut -d " " -f 1 <(pacman -Qu) | tr "\n" " ")
    # enumerate the updates
    pacman_num_updates_availible=$(echo $pacman_updates_availible | wc -w)

    if [[ $pacman_num_updates_availible > 0 ]]
        then 
            if [[ $pacman_num_updates_availible == 1 ]]
                then pacman_updates_string="\e[1;33mThere is an update availible: $pacman_updates_availible"
                else pacman_updates_string="\e[1;33mThere are $pacman_num_updates_availible updates availible: $pacman_updates_availible"
            fi
    fi

    pacman_updates_string_wc=$(echo $pacman_updates_string | wc -w)
    # while the length of the update string is longer than columns:
    while [ "${#pacman_updates_string}" -gt "$COLUMNS" ]; do 
        let pacman_updates_string_wc--
        pacman_updates_string=$(echo $pacman_updates_string | cut -d " " -f -$pacman_updates_string_wc) # cut off last word
        pacman_updates_string="$pacman_updates_string""..." # add an ellipsis to last word
    done
    test "$pacman_updates_string" && echo -e $pacman_updates_string
fi
