# TODO before stow make sure that those files get deleted
stow emacs
stow guix
# stow termux


pkg upgrade
pkg install root-repo x11-repo git gtypist huspell huspell-ru openssh stow texinfo mpv-x
emacs-x curl man python
mkdir NextCloud
ln -s -t NextCloud/ /data/data/com.termux/files/home/storage/shared/Android/media/com.nextcloud.client/nextcloud/up201106482@fc.up.pt@cloud.owncube.com/*
