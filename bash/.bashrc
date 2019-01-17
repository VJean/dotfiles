#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# load colorscheme from pywal
(cat ~/.cache/wal/sequences &)

# enable bash completion for git
source /usr/share/git/completion/git-completion.bash
# make git prompt available 
source /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=auto

PS1='\[\e[32;1m\]\u@\h \W\[\e[0m\]\[\e[3m\]$(__git_ps1 " (%s)") \[\e[0m\]\[\e[32;1m\]\$ \[\e[0m\]'

eval $(thefuck --alias)

shopt -s checkwinsize
export HISTSIZE=2000
export HISTFILESIZE=5000
shopt -s histappend

source /home/jean/git/z/z.sh

alias ls='ls --color=auto'
alias l='ls -CAhl'
alias h='history'
alias testping='ping archlinux.org'

cdl() { cd $1 && l; }

