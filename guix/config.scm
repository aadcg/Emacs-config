;; This is an operating system configuration generated
;; by the graphical installer.

(use-modules (gnu))
(use-service-modules desktop networking ssh xorg)

(operating-system
  (host-name "xps")
  (timezone "Europe/Moscow")
  (locale "en_US.utf8")
  (keyboard-layout
    (keyboard-layout "us" "altgr-intl"))
  (bootloader
    (bootloader-configuration
      (bootloader grub-bootloader)
      (target "/dev/sda")
      (keyboard-layout keyboard-layout)))
  (swap-devices (list "/dev/sda2"))
  (file-systems
    (cons* (file-system
             (mount-point "/")
             (device
               (uuid "c492a3da-1754-4ab1-bed5-172cc785840f"
                     'ext4))
             (type "ext4"))
           %base-file-systems))
  (users (cons* (user-account
                  (name "aadcg")
                  (comment "Aadcg")
                  (group "users")
                  (home-directory "/home/aadcg")
                  (supplementary-groups
                    '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))
  (packages
    (append
     (map specification->package
          '(
            "aspell"
            "aspell-dict-en"
            "aspell-dict-pt-pt"
            "aspell-dict-ru"
            "emacs"
            "emacs-pdf-tools"
            "font-fira-code"
            "git"
            "icecat"
            "nix"
            "nss-certs"
            "owncloud-client"
            "setxkbmap"
            "stow"
            "stumpwm"
            "xterm"
            ))
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
