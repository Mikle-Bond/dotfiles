#!/bin/sh

# Load profile
for file in "/etc/xprofile" "$HOME/.xprofile"; do
    if [ -f "$file" ]; then
        echo "Loading profile from $file";
        . "$file"
    fi
done

# Load resources
for file in "/etc/X11/Xresources" "$HOME/.Xresources"; do
    if [ -f "$file" ]; then
        echo "Loading resource: $file"
        xrdb -merge "$file"
    fi
done

# Run all system xinitrc shell scripts
xinitdir="/etc/X11/xinit/xinitrc.d"
if [ -d "$xinitdir" ]; then
    for script in $xinitdir/*; do
        echo "Loading xinit script $script"
        if [ -x "$script" -a ! -d "$script" ]; then
            . "$script"
        fi
    done
fi

xset -dpms s off -b
xsetroot -solid "#1e1e1e"
# ( feh --bg-scale --no-fehbg "$(< "${HOME}/.cache/wal/wal")" )&

ulimit -c unlimited

compton &
numlockx &
unclutter --jitter 40 --ignore-scrolling --fork
xinput disable "SynPS/2 Synaptics TouchPad"

#systemctl --user start feh-background@5m.timer
systemctl --user restart feh-background

syndaemon -i 2 -R -K -d -t
# xset led named "Num Lock"
xset r rate 250 30
# /home/mikle/dev/scripts/mpd_watch.sh &

# echo "starting at $(date)" >> ~/.i3/logfile
exec i3
#exec xmonad

