setxkbmap -layout fr

xrdb -merge ~/.Xresources

compton -b
test -f ~/.fehbg && ~/.fehbg &
wal -R -a 90
redshift &

exec bspwm
