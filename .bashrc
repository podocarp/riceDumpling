#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -a -l'
alias weather='curl http://wttr.in/Singapore'

complete -cf sud

cdl(){ cd "$@" && ls; }

set -o vi

export PATH=$PATH:~/go/bin

export PS1=$'\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 4)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]] \[\e[0m\\]\n ⇝ \$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
