# first, get functions from .bash/functions if it exists
if [ -f ~/.bash/functions ]; then
    source ~/.bash/functions
fi

# add some useful shortcuts activated by pressing Ctrl+<key> in the shell

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

# Find PIDs listening on specified port(s)
function busy_ports {
    if [ $# -eq 0 ]; then
        echo "Usage: busy_ports <port> [port2] [port3] ..."
        echo "Example: busy_ports 8080"
        echo "Example: busy_ports 8080 3000 5432"
        return 1
    fi

    for port in "$@"; do
        local pids=$(lsof -i ":$port" -sTCP:LISTEN -t 2>/dev/null)
        if [ -n "$pids" ]; then
            echo "$pids"
        fi
    done
}

function prepend-editor {
    if [[ ! "$BUFFER" =~ "$EDITOR.*" ]]; then
        BUFFER="$EDITOR $BUFFER"
        zle end-of-line
    fi
}
zle -N prepend-editor
bindkey "^E" prepend-editor

function __ranger {
    BUFFER=ranger
    zle accept-line
}
zle -N __ranger
bindkey "^N" __ranger # mnemonic: Navigate

# leftover key sequences:
# ^T ^P ^S ^F ^K ^A ^Z ^X ^B