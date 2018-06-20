setxkbmap -layout fr

xrdb -merge ~/.Xresources

test -f ~/.fehbg && ~/.fehbg &

compton -b
dunst &
wal -R -a 90
redshift &



exec bspwm
