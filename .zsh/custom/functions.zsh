# webpass command: generates a password for every website

function webpass {
    #usage: webpass <website>

    website=$1
    stty -echo
    echo -n "Password: "
    read password
    echo
    stty echo

    echo "$password$website" | sha1sum - | cut -d" " -f1 | xxd -r -p | base64 | tr -d -c '[:alnum:]'
    echo
}

function random.org {
    curl "http://www.random.org/integers/?num=1&min=""$1""&max=""$2""&col=1&base=10&format=plain&rnd=new"
}

function pacsize {
     pacman -Qi $(pacman -Qq) | grep 'Name\|Size' | cut -d: -f2 | paste - - | column -t | sort -nk2
}

# usage: plays back a text-to-speech recording of the argument(s)

function say { 
	if [[ "${1}" =~ -[a-z]{2} ]]
		then local lang=${1#-} 
			local text="${*#$1}" 
		else local lang=${LANG%_*} 
			local text="$*"
	fi
 	cvlc "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" "vlc://quit" #&> /dev/null 
}

function until-success {
    $@ || until-success $@
}

function man {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@";
}

function pwr {
    if [ -z "$@" ]; then
        echo "
        pwr is a short function for controlling the system power.
        usage: pwr <command>
        
        <command> is one of:
            [h]ibernate
            [s]hutdown or [o]ff
            [r]eboot
        note that only the first letter of each command is required.
        "
        return 1
    elif [[ "$1" = h* ]]; then
        sync
        sudo /usr/lib/systemd/systemd-sleep hibernate
    elif [[ "$1" = s* ]] || [[ "$1" = o* ]]; then
        sudo systemctl poweroff
    elif [[ "$1" = r* ]]; then
        sudo systemctl reboot
    else
        echo "could not parse argument. run the command without any arguments for usage instructions."
        return 2
    fi
}

function sudo-accept-line {
    if [ -z "$BUFFER" ]; then
        BUFFER="sudo $(fc -n -l -1)"
        zle end-of-line
        zle accept-line
    elif [ -n "${BUFFER## *}" ]; then
        BUFFER="sudo ${BUFFER## *sudo }"
        zle end-of-line        
        zle accept-line
    fi
}
zle -N sudo-accept-line
bindkey "^O" sudo-accept-line
