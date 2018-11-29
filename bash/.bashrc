#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# load colorscheme from pywal
(cat ~/.cache/wal/sequences &)

PS1='\e[32;1m\u@\h \W \$ \e[0m'

eval $(thefuck --alias)

shopt -s checkwinsize
export HISTSIZE=2000
export HISTFILESIZE=5000
shopt -s histappend

alias ls='ls --color=auto'
alias l='ls -CAhl'
alias h='history'
alias testping='ping archlinux.org'

cdl() { cd $1 && l; }

