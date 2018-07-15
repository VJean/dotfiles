setxkbmap -layout fr

xrdb -merge ~/.Xresources

test -f ~/.fehbg && ~/.fehbg &

compton -b
wal -R -a 80
redshift &

amixer -q set Master 70%

exec bspwm
