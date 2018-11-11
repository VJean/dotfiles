# azerty keyboard layout
setxkbmap -layout fr

# apply .Xresources values (urxvt, ...)
xrdb -merge ~/.Xresources

# set desktop wallpaper if it exists
test -f ~/.fehbg && ~/.fehbg &

# Compositor
compton -b

# set color scheme from current wallpaper
wal -R -a 90

# filter blue colors on the screen
redshift &

# set volume at 70%
amixer -q set Master 70%

# manage usb devices (automount, notify, etc)
udiskie &

# execute the actual window manager
exec bspwm
