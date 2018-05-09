#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
PS1='[\u@\h \W]\$ '
complete -cf sud

cdl(){ cd "$@" && ls; }

PS1=$'\\[\e[31m\\]\u2234\\[\e[0m\\]\n\u2192 \u263f \\~ \\[\e[31m\\]\u2605 $? \\[\e[0m\\]'

export PS1=$'\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 4)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]] \[\e[0m\\]\n ⇝ \$ '
