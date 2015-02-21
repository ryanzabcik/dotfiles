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
# ^T ^P ^S ^F ^K ^A ^Z ^X ^B ^N
