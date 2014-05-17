precmd () {
    let FILLSIZE=${COLUMNS}-9
    FILL=""
    while [ "$FILLSIZE" -gt "0" ]
    do
        FILL="$LINECHAR${FILL}" # FILL with underscores to work on 
        let FILLSIZE=${FILLSIZE}-1
    done
}

if [[ $(locale charmap) != UTF-8 ]] || [ "$TERM" = linux ]; then
    PREFIX=">"
    LINECHAR="-"
    LCOLOR=""
else
    PREFIX="❱" # U+2771
    LINECHAR="─"
    LCOLOR="$fg_bold[black]"
fi

if [ $EUID -eq 0 ]; then
    PREFIX="#%b"
fi

if [[ $TERM = *256color ]]; then
    if [ $EUID -eq 0 ]; then
        PCOLOR=(
            $fg_bold[red]
            $fg_bold[red]
            $fg_bold[red]
            $fg_bold[red]
        )
    elif [[ $HOST = tachyon* ]]; then
        PCOLOR=(
            $FG[039]
            $FG[037]
            $FG[035]
            $FG[040]
        )
    elif which python3 > /dev/null; then
        local code='
import hashlib

a = hashlib.md5("'"$HOST"'".encode("utf-8"))
b = a.hexdigest()
as_int = int(b, 16)
print(str(as_int % 34 * 6 + 16))
    '
        local basenum=$(echo "$code" | python3)
        PCOLOR=(
            $FG[$(printf %03d $basenum)]
            $FG[$(printf %03d $(( $basenum + 2 )))]
            $FG[$(printf %03d $(( $basenum + 4 )))]
            $FG[$(printf %03d $(( $basenum + 5 )))]
        )
        unset code
        unset basenum
    fi
fi

# Other possible prefix characters: 
# Gullimet           U+00BB »
# Electric arrow     U+2301 ⌁
# Bullet             U+2202 •
# The following are wider than the fixed-width column:
# Sine wave          U+223F ∿
# Much greater than  U+226B ≫
# Arrowhead          U+27A4 ➤
# Round arrow        U+279C ➜

PROMPT='%{$LCOLOR$FILL%} %*
%{$reset_color$PCOLOR[1]%}%m%{$PCOLOR[2]%} %2~%{$PCOLOR[3]%}$(git_prompt_info)$(dropbox_status) %(?.%{$PCOLOR[4]%}.%{$fg[red]%}%?)$PREFIX %f'

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_STASHED="^"
ZSH_THEME_DROPBOX_PROMPT_PREFIX=" ("
ZSH_THEME_DROPBOX_PROMPT_SUFFIX=")"
