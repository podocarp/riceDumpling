#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -a -l'
alias dfh='df -h'
alias f="grep -RHn"
alias v='vim'
alias v.='v .'

alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias sx='startx'

complete -cf sudo

cdl(){ cd "$@" && ls; }

weather(){
	st -g 130x40 -t float -e sh -c "curl "http://wttr.in/$1?m" -sS | head -n -3 ; read -p 'Press enter to quit';"
}

AURClone(){
	git clone https://aur.archlinux.org/$1.git
}

function ranger {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

export PYTHONSTARTUP=~/.pythonrc
export GOPATH=$HOME/go
export PATH=$PATH:~/go/bin:~/Scripts:~/.local/bin

stty -ixon
set -o vi

PS1temp=$'┌\[\u@\h \w\]'

divider(){
	promptlen=$(printf '%s\n' "${PS1temp@P}" | wc -m)
	eval printf %.0s─ {1..$(($(tput cols) - $promptlen))}\}
}

export PS1=$'┌\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 4)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]] \[\e[0m\\]`divider`\n → \$ '

HISTCONTROL=ignoreboth

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# for direnv
# eval "$(direnv hook bash)"
