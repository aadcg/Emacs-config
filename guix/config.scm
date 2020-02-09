(use-modules (gnu))
(use-service-modules desktop networking ssh xorg)

(operating-system
  (locale "en_US.utf8")
  ;; (timezone "Europe/Moscow")
  (timezone "Europe/Lisbon")
  (keyboard-layout
    (keyboard-layout "us" "altgr-intl"))
  (bootloader
    (bootloader-configuration
      (bootloader grub-efi-bootloader)
      (target "/boot/efi")
      (keyboard-layout keyboard-layout)))
  (swap-devices (list "/dev/nvme0n1p2"))
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
  (host-name "guix-xps13")
  (users (cons* (user-account
                  (name "aadcg")
                  (comment "")
                  (group "users")
                  (home-directory "/home/aadcg")
                  (supplementary-groups
                    '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))
  (packages
   (append
    (list (specification->package "nss-certs")
          (specification->package "stumpwm")
          (specification->package "openfwwf-firmware"))
      %base-packages))
  (services
    (append
      (list (service gnome-desktop-service-type)
            (service openssh-service-type)
            (service tor-service-type)
            (set-xorg-configuration
              (xorg-configuration
                (keyboard-layout keyboard-layout))))
      %desktop-services)))
