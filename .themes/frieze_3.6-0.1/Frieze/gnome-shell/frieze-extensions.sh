#!/bin/bash
#
# Frieze extensions tool, version 0.4
#   Copyright 2012, Jacob van Mourik
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by 
# the Free Software Foundation, either version 3 of the License, or 
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

thm_name='Frieze'
thm_file='frieze/gnome-shell.css'
ext_dir='frieze/extensions'

msg_header='Frieze Extensions'
msg_reload='(After making changes, refresh the theme by pressing Alt+F2, typing r and pressing Enter)'
msg_auth='You need to be root to run this script'
msg_no_ext='No extensions found'
msg_enable_ext='Do you want to enable this extension?'
msg_disable_ext='Do you want to disable this extension?'

err_thm_file='error: theme file could not be found'
err_ext_dir='error: extensions dir could not be found'
err_input='error: invalid input'

init() {
    need_root=false
    # check if root access is needed
    (( $UID != 0 )) && [[ $0 =~ ^/usr/.*$ ]] && need_root=true && echo -e $msg_auth && return 1
    # check if theme file exists and is valid
    [[ ! -f $thm_file || $(grep $thm_name $thm_file) == "" ]] && echo -e $err_thm_file && return 1
    # check if extension dir exists
    [[ ! -d $ext_dir ]] && echo -e $err_ext_dir && return 1
    # load extension data
    load_ext_data
    # get terminal width
    terminal_width=$(tput cols)
    # define line separator
    hr=''; for (( i=0; i < $terminal_width; i++ )); do hr+='='; done
    # define position extension title within table
    title_pos=$((${#ext_count} + 3))
    # define position extension status within table
    status_pos=$(($terminal_width - 15))
    return 0
}

load_ext_data() {
    # get all available extensions
    ext_file=($(find $ext_dir/ -name \*.css | sort))
    # check if list of available extensions is not empty
    ext_count=${#ext_file[@]}
    (( $ext_count == 0 )) && echo -e $msg_no_ext && return 1
    # extract data from available extensions
    for (( i=0; i < $ext_count; i++ )); do
        ext_status[$i]=$(grep -c ${ext_file[$i]} $thm_file)
        ext_descr[$i]=$(grep 'Description:' ${ext_file[$i]} | cut -d ':' -f 2 | sed 's/^ *//')
        ext_title[$i]=$(grep 'Title:' ${ext_file[$i]} | cut -d ':' -f 2 | sed 's/^ *//')
        [[ ${ext_title[$i]} == "" ]] && ext_title[$i]=$(echo ${ext_file[$i]} | sed 's/.*\///')
    done
}

update() {
    # clear terminal window
    tput clear
    # print extensions overview
    print_overview
}

switch_status() {
    # update theme file
    if (( ${ext_status[$1]} == 0 )); then
        # get position where to add import rule to theme file
        for (( i=$(($1 - 1)); i >= 0; i-- )); do
            (( ${ext_status[$i]} == 1 )) && local prev=${ext_file[$i]} && break
        done
        # add import rule to theme file
        if [[ $prev == "" ]]; then
            sed -i "$ a @import url('${ext_file[$1]}');" $thm_file
        else
            local url=$(echo $prev | sed 's/[[\/.*]\|\]/\\&/g')
            sed -i "/$url/a @import url('${ext_file[$1]}');" $thm_file
        fi
    else
        # remove import rule from theme file
        local url=$(echo ${ext_file[$1]} | sed 's/[[\/.*]\|\]/\\&/g')
        sed -i "/$url/d" $thm_file
    fi
    # update extension data
    ext_status[$1]=$(grep -c ${ext_file[$1]} $thm_file)
}

print_overview() {
    # print header
    echo -e $msg_header'\n'
    echo -e $msg_reload'\n'
    # print extension table
    print_ext_table
    # print help info
    echo -e 'Exit: press Ctrl+C\n'
}

print_ext_table() {
    # print column headers
    echo $hr
    echo -e "\033[${title_pos}G"'Extension'"\033[${status_pos}G"'Status'
    echo $hr
    # print row data
    for (( i=0; i < $ext_count; i++ )); do
        local title=${ext_title[$i]}
        (( $title_pos + ${#title} + 1 >= $status_pos ))\
         && title=${title:0:$(($status_pos - $title_pos - 4))}'...'
	    echo -n $(($i + 1))')'
	    echo -en "\033[$((${#ext_count} + 3))G"$title
	    echo -en "\033[${status_pos}G"'[ '
	    (( ${ext_status[$i]} == 0 )) && echo -n 'Disabled' || echo -en "\033[1m"'Enabled'"\033[m"
	    echo -e "\033[$(($status_pos + 11))G"']'
    done
    echo $hr
}

print_ext_info() {
    # print title
    echo -e $(($1 + 1))') '${ext_title[$1]}
    # print description
    [[ ${ext_descr[$1]} != "" ]] && echo -e $hr${ext_descr[$1]}'\n'$hr
}

if init; then
    update
    while true; do
        # ask for selection
        echo -en "Select extension [1..${#ext_file[@]}]: "; read num
        # handle the input
        if [[ $num =~ ^[1-9][0-9]*$ ]] && (( $num <= ${#ext_file[@]} )); then
            ((num -= 1))
            # print extension info
            echo ''; print_ext_info $num; echo ''
            # ask for confirmation
            (( ${ext_status[$num]} == 0 )) && echo -en $msg_enable_ext\
             || echo -en $msg_disable_ext; echo -en ' [y/N]: '; read input
            # handle the input
            case $input in
              y|Y) switch_status $num; update;;
              *) update;;
            esac
        elif [[ $num != "" ]]; then
            echo -e $err_input
        fi
    done
elif [[ $need_root == true ]]; then
    # rerun the script with sudo or su
    [[ -f /usr/bin/sudo ]] && exec sudo bash $0 || exec su -c "bash $0"
else
    # keep terminal open for error messages
    exec bash
fi

