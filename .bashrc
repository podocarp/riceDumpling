#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=/usr/bin/nvim

alias dfh='df -h'
alias f="grep -RHn"
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -a -l'
alias ls='ls --color=always'
alias v="vim"
alias v.="v ."
alias vim="nvim"
alias vifm="vf"

alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias sx='startx'

complete -cf sudo

cdl(){ cd "$@" && ls; }

AURClone(){
    git clone https://aur.archlinux.org/$1.git
}

export PYTHONSTARTUP=~/.pythonrc
export GOPATH=$HOME/go
export PATH=$PATH:~/.config/scripts/:~/.local/bin:~/.yarn/bin/:$GOPATH/bin
export _JAVA_AWT_WM_NONREPARENTING=1

stty -ixon
set -o vi

PS1temp=$'┌\[\u@\h \w\]'

divider(){
    promptlen=$(printf '%s\n' "${PS1temp@P}" | wc -m)
    eval printf %.0s─ {1..$(($(tput cols) - $promptlen))}\}
}

export PS1=$'┌\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 4)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]] \[\e[0m\\]`divider`\n → \$ '

HISTCONTROL=ignoreboth

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
