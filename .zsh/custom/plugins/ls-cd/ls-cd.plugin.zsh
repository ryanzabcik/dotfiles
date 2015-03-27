# automatically ls after cd'ing into a new directory

function chpwd {
    if [ $LINES -lt $(ls -C --width=$COLUMNS | wc -l) ]; then
        echo -e "\e[1;31mtoo many files in this directory; use ls to view"
    else
        ls -v --color=auto
    fi
}
