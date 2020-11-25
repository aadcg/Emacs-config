# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# added by Nix installer
if [ -e /home/aadcg/.nix-profile/etc/profile.d/nix.sh ]
then . /home/aadcg/.nix-profile/etc/profile.d/nix.sh
fi

if [ $DESKTOP_SESSION == /run/current-system/profile/share/xsessions/exwm ]
then
    intern=eDP-1
    extern=DP-1

    if xrandr | grep "$extern disconnected"; then
        xrandr --output "$extern" --off --output "$intern" --mode 2560x1440
    else
        xrandr --output "$intern" --off --output "$extern" --mode 2560x1440 --primary
    fi

    redshift &
    picom &

fi

if [ "$(tty)" = "/dev/tty2" ]; then exec sway; fi
