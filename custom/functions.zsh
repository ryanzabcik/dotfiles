# webpass command: generates a password for every website

function webpass {
    #usage: webpass <website>

    website=$1
    stty -echo
    read -p "Password: " password
    echo
    stty echo

    echo "$password$website" | sha1sum - | cut -d" " -f1 | xxd -r -p | base64 | tr -d -c [:alnum:]
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
 	cvlc "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" "vlc://quit" &> /dev/null 
}

function typeout {
    msg=$1
    let lnstr=$(expr length "$msg")-1
    for (( i=0; i <= $lnstr; i++ ))
    do
        echo -n "${msg:$i:1}"
        sleep .1
    done
    echo
}

function until-success {
    $@ || until-success $@
}

function type-forever {
    if [ "$1" == "" ]; then
        echo "usage: type each key separated by a space, then finally an interval by which to sleep"
    else
        i=1
        while true; do    
            eval echo \${$i} # evaluates to ith argument
            i=$(( i % $# + 1 )) # cycles like 1 2 ... N 1 2 ...
            if [ "$i" == "$#" ]; then
                sleep $(eval echo \${$i})
            else
                xdotool key $(eval echo \${$i})
            fi
        done
    fi
}

function spaces-inbetween {
    for (( i=0; i<${#1}; i++ )); do
        echo -n "${1:$i:1} "
    done
    echo
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
            [s]hutdown or [p]oweroff
            [r]eboot
        note that only the first letter of each command is required.
        "
        return 1
    elif [[ "$1" = h* ]]; then
        sudo /usr/lib/systemd/systemd-sleep hibernate
    elif [[ "$1" = s* ]] || [[ "$1" = p* ]]; then
        sudo systemctl poweroff
    elif [[ "$1" = r* ]]; then
        sudo systemctl reboot
    else
        echo "could not parse argument. run the command without any arguments for usage instructions."
        return 2
    fi
}

