#!/bin/bash
# This sets everything up on a fresh install
# Destroys everything you once had.
dir="$(dirname "$(realpath "$0")")"
modifications=(".Xmodmap" ".Xdefaults" ".pythonrc" ".bashrc" ".config" ".vimrc" ".inputrc" ".xinitrc" ".xprofile" ".local")

for mod in "${modifications[@]}"
do
	if [ -e ~/$mod ] || [ -L ~/$mod ] || [ -d ~/$mod ]
	then
		rm ~/$mod -r
	fi
	ln -sv $dir/$mod ~/$mod
done

echo "Getting Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "all done!"
