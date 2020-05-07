(use-modules (gnu))
(use-service-modules desktop networking ssh xorg pm)

(operating-system
  (locale "en_US.utf8")
  ;; (timezone "Europe/Moscow")
  (timezone "Europe/Lisbon")
  (keyboard-layout
   (keyboard-layout
    "us,ru" "altgr-intl"
    #:options
    '("grp:win_space_toggle"
      "caps:ctrl_modifier")))
  (host-name "guix-xps13")
  (users (cons* (user-account
                 (name "aadcg")
                 (comment "André Alexandre Gomes")
                 (group "users")
                 (home-directory "/home/aadcg")
                 (supplementary-groups
                  '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))
  (bootloader
   (bootloader-configuration
    (bootloader grub-efi-bootloader)
    (target "/boot/efi")
    (keyboard-layout keyboard-layout)))
  (file-systems
   (cons* (file-system
           (mount-point "/boot/efi")
           (device (uuid "C820-AFF2" 'fat32))
           (type "vfat"))
          (file-system
           (mount-point "/")
           (device
            (uuid "76936a31-ce9b-4a50-a373-31db7a89ce41"
                  'ext4))
           (type "ext4"))
          %base-file-systems))

  (packages
   (append (map specification->package
                '("nss-certs"
                  "i3status"
                  "sway"
                  "swaylock"
                  "swayidle"
                  "grim"))
           %base-packages))
  (services
   (append
    (list
     (service gnome-desktop-service-type)
     (service openssh-service-type)
     (service tor-service-type)
     (service tlp-service-type)
     (set-xorg-configuration
      (xorg-configuration
       (keyboard-layout keyboard-layout))))
    %desktop-services)))
