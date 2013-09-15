if [ -x "$(which dropbox)" ] && [ -e "$HOME/.dropbox/host.db" ]; then
    USE_DROPBOX=yes
    DROPBOX_DIR="$(cat ~/.dropbox/host.db | head -2 | tail -1 | base64 --decode)"
fi

dropbox_status () {
    if [ "$USE_DROPBOX" ] && [ "$(pwd -P)" = "$DROPBOX_DIR" ]; then
        echo -n "$ZSH_THEME_DROPBOX_PROMPT_PREFIX$(dropbox status)$ZSH_THEME_DROPBOX_PROMPT_SUFFIX"
    fi
}

