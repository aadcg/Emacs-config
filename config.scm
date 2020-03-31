(use-modules (gnu))
(use-service-modules desktop networking ssh xorg)

(define %emacs
  (map specification->package
       '("emacs"
         ;; "emacs-zenburn-theme"
         ;; "emacs-moody"
         "emacs-minions"
         "emacs-hide-mode-line"
         "emacs-avy"
         ;; "emacs-elpy"
         "emacs-company-jedi"
         ;; "emacs-ein"
         "emacs-haskell-mode"
         "emacs-go-mode"
         ;; "emacs-company-go"
         "emacs-auctex"
         "emacs-magit"
         "emacs-diff-hl"
         ;; "emacs-gitignore-mode"
         "emacs-yaml-mode"
         "emacs-csv-mode"
         "emacs-gitlab-ci-mode"
         "emacs-dockerfile-mode"
         "emacs-projectile"
         "emacs-rainbow-delimiters"
         "emacs-org"
         "emacs-ob-ipython"
         ;; "emacs-ob-go"
         "emacs-htmlize"
         ;; "emacs-org-drill"
         ;; "emacs-org-drill-table"
         "emacs-cdlatex"
         ;; "emacs-org-pdfview"
         "emacs-org-tree-slide"
         "emacs-org-bullets"
         "emacs-guix"
         ;; "emacs-pretty-sha-path"
         "emacs-flycheck"
         ;; "emacs-flyspell"
         "emacs-pdf-tools"
         "emacs-smartparens"
         "emacs-expand-region"
         ;; "emacs-counsel"
         "emacs-smex"
         "emacs-company"
         ;; "emacs-speed-type"
         ;; "emacs-default-text-scale"
         "emacs-google-translate"
         "emacs-emms"
         "emacs-telega"
         "emacs-emojify"
         "emacs-wttrin"
         )))

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
    %emacs
    (map specification->package
         '(
           "alsa-utils"
           "aspell"
           "aspell-dict-en"
           "aspell-dict-pt-pt"
           "aspell-dict-ru"
           "audacity"
           "curl"
           "font-fira-code"
           "font-hack"
           "git"
           "gnupg"
           "gtypist"
           "icecat"
           "imagemagick"
           "light"
           "mpv"
           "nitrogen"
           "nss-certs"
           "openfwwf-firmware"
           "owncloud-client"
           "pavucontrol"
           "python"
           "python-autopep8"
           "python-black"
           "python-flake8"
           "python-ipython"
           "python-jedi"
           "python-pip"
           "python-rope"
           "python-virtualenv"
           "python-yapf"
           "grim"
           "setxkbmap"
           "sicp"
           "slock"
           "stow"
           "sway"
           "swaylock"
           "texlive"
           "tor"
           "transmission"
           "xmodmap"
           "xrandr"
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
