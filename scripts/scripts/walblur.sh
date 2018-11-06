#!/bin/bash
# The given picture is blurred, scaled to fit the current resolution.
# The output is saved as 'walblur.png' next to the given picture.

if [[ $# -ne 1 ]]
then
    echo "What picture do you want me to process ? ( 1 arg expected, got $# )"
    exit 1
elif [[ ! -f $1 ]]
then
    echo "The given picture does not exist."
    exit 1
fi

echo "Starting."

screen_size=$(xrandr | head -1 | sed -r 's/^.*current ([0-9]+) x ([0-9]+),.*/\1x\2/')
echo "Output will be scaled to ${screen_size}"

dir=$(dirname $1)
target=${dir}/walblur.png
echo "Saving to ${target}"

convert $1 -resize ${screen_size}^ -blur 0x20 ${target} && echo "Done."

