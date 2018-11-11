#
# ~/.bash_profile
#

[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

# start X (sources ~/.xinitrc)
[[ $(tty) == "/dev/tty1" ]] && source /usr/bin/startx
