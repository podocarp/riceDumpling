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
alias v="vim"
alias v.="v ."
alias vim="nvim"
alias vifm="vf"

alias u="urxvt &"

alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias sx='startx'
alias nsx='nvidia-xrun'

complete -cf sudo

cdl(){ cd "$@" && ls; }

vf(){
    command vifmi "$@"
    if [ -f /tmp/lastdir ]; then
        cd `cat /tmp/lastdir`
    fi
}

export PYTHONSTARTUP=~/.pythonrc
export GOPATH=$HOME/go
export PATH=$PATH:~/.config/scripts/:~/.local/bin:$GOPATH/bin:~/.gem/ruby/2.4.0/bin:~/.cabal/bin/
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
