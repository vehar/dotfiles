#!/bin/bash

if [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Color prompt with Git branch
source /usr/share/git/git-prompt.sh
PS1='\[\e[1;32m\][\u@\h \W\[\033[1;36m\]$(__git_ps1)\[\033[1;32m\]]\$\[\e[0m\] '

# CNF
source /usr/share/doc/pkgfile/command-not-found.bash

# Editor
export EDITOR="vim"

# List largest files
alias ducks='du -cksh *|sort -rh|head -11'

function ups() {
    if [ $# -eq 0 ]; then
        echo "`basename "$0"`: specify a number" >&2
        return 1
    fi
    eval printf '../%.s' {1.."$1"}
}
function up() {
    local cwd="$PWD"
    if [ $# -eq 0 ]; then
        local lev=0
        while [ "$cwd" ]; do
            expand -t3 <<< "$lev	-> $cwd"
            cwd=${cwd%/*}
            lev=$((lev+1))
        done
        expand -t3 <<< "$lev	-> /"
    else
        local lev="$1"
        UPDIR="$PWD"
        cd $(ups $1)
    fi
}
function down() {
    if [[ "$UPDIR" && "$UPDIR" == $PWD* ]]; then
        cd "$UPDIR"
    else
        echo "`basename $0`: can't go down" >&2
        return 127
    fi
}

# Miscellaneous bindings
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias dammit='sudo $(history -p \!\!)'
function mdcd() { if [ -z "$1" ]; then return; fi; mkdir "$1"; cd "$1"; }
alias ls='ls --color=auto'

# Convenient and more memorable alias for combine (from moreutils)
alias _=combine

export PATH=~/bin:$PATH

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;\$!ba;s/\n/ /g')"

# Various shell settings:

# Ctrl-W should rub out only to filename boundary
set bind-tty-special-chars off
bind '\C-w:unix-filename-rubout'

# tabs should be 4 chars long
tabs 4

# Local customizations allowed and encouraged!
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# Fortune! (if available)
fortune 2> /dev/null