#!/bin/bash
# This sets everything up on a fresh install
# Destroys everything you once had.
dir="$(dirname "$(realpath "$0")")"
modifications=(
".Xdefaults" ".Xmodmap" ".bashrc" ".config" ".inputrc" ".latexmkrc" ".local" \
".pam_environment" ".pythonrc" ".vimrc" ".xbindkeysrc" ".xinitrc" "texmf")

askYn() {
    local prompt=$1
    local ycmd=$2
    local ncmd=$3
    echo $prompt "[y/n]"
    while true; do
        read yn
        case $yn in
            [Yy]* ) eval $ycmd; return;;
            [Nn]* ) eval $ncmd; return;;
            * ) echo "Unrecognized response.";;
        esac
    done
}

echo "This script will link make links in your HOME dir to the files in this \
repo, amongst other things."

askYn "Perform a one-shot installation of all files (no prompts)?" \
    "oneshot=1" "oneshot=0"

for mod in "${modifications[@]}"
do
    if [[ $oneshot == 0 ]]; then
        echo "===== Processing file:" $mod "====="
    fi

    if [[ -e ~/$mod ]] || [[ -L ~/$mod ]] || [[ -d ~/$mod ]]; then
        if [[ $oneshot == 0 ]]; then
            askYn "File exists. Proceed anyway?" "res=1" "res=0"
            if [[ $res == 0 ]]; then
                continue;
            fi
        fi
        rm ~/$mod -rv
    fi
    ln -sv $dir/$mod ~/$mod
done

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "all done!"
