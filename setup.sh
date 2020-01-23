#!/bin/bash
# This sets everything up on a fresh install
# Destroys everything you once had.
dir="$(dirname "$(realpath "$0")")"
modifications=(".Xmodmap" ".Xdefaults" ".pythonrc" ".bashrc" ".config" ".vimrc"\
    ".inputrc" ".xbindkeysrc" ".xinitrc" ".xprofile" ".local"\
    ".pam_environment" ".latexmkrc" "texmf")

for mod in "${modifications[@]}"
do
	if [ -e ~/$mod ] || [ -L ~/$mod ] || [ -d ~/$mod ]
	then
		rm ~/$mod -r
	fi
	ln -sv $dir/$mod ~/$mod
done

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "all done!"
