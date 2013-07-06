#!/bin/bash

dotglob_status=$(shopt | grep dotglob | rev | cut -d " " -f 1 | rev | tr -d "[ \011]")

shopt -s dotglob

for file in dotfiles/*;
do
    ln -s dotfiles/$file $file

[ "$dotglob_status" == "off" ] && shopt -u dotglob
