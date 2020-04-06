# swap backspace and \| on my external keyboard
# if [ -d "/run/udev/links/\\x2finput\\x2fby-id\\x2fusb-CATEX_TECH._66EC-S_CA2017120001-event-kbd" ]
# then
#     xmodmap -e "keycode 51 = BackSpace"
#     xmodmap -e "keycode 22 = backslash bar"
#     # xmodmap -e "keycode 22 = BackSpace"
#     # xmodmap -e "keycode 51 = backslash bar"
# fi

# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# added by Nix installer
if [ -e /home/aadcg/.nix-profile/etc/profile.d/nix.sh ]
then . /home/aadcg/.nix-profile/etc/profile.d/nix.sh
fi

# if running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then exec sway; fi
