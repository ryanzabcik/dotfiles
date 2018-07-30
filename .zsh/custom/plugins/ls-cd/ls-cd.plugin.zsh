# automatically ls after cd'ing into a new directory

function chpwd {
    if [ $LINES -lt $(gls -C --width=$COLUMNS | wc -l) ]; then
        echo -e "\e[1;31mtoo many files in this directory; use ls to view"
    else
        gls -v --color=auto
    fi
}
