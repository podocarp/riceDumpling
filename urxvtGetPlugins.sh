#!/bin/bash
#Grabs urxvt plugins

dir="$HOME/.urxvt/ext"
if ! [ -d "$dir" ]
then
	mkdir $dir -p
fi

curl https://raw.githubusercontent.com/muennich/urxvt-perls/master/keyboard-select -o "$dir/keyboard-select"
curl https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size -o "$dir/font-size"
