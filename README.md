# Dotfiles

Installation and management with GNU stow.

# Requirements

## bpswm

* bspwm, sxhkd, xorg
* urxvt
* rofi
* redshift
* pywal

## Pacman pkg list

`./pkglist.txt` is updated with the following pacman hook :
```
[Trigger]
Operation = Install
Operation = Remove
Type = Package
Target = *

[Action]
When = PostTransaction
Exec = /bin/sh -c '/usr/bin/pacman -Qqe > /home/user/dotfiles/pkglist.txt'
```
