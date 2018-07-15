setxkbmap -layout fr

xrdb -merge ~/.Xresources

test -f ~/.fehbg && ~/.fehbg &

compton -b
dunst &
wal -R -a 80
redshift &

amixer -q set Master 70%

exec bspwm
