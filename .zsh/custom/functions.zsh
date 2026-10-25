# first, get functions from .bash/functions if it exists
if [ -f ~/.bash/functions ]; then
    source ~/.bash/functions
fi

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
