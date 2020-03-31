(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Initialise the packages, avoiding a re-initialisation.
(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

;; Make sure `use-package' is available.
;; Useless if I use guix
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defvar in-termux-p
  (and (equal (system-name) "localhost")
       (not (equal user-login-name "aadcg")))
  "t if using GNU Emacs on Termux")

;; (use-package auto-package-update
;;   :ensure t
;;   :config
;;   (auto-package-update-maybe)
;;   (setq auto-package-update-prompt-before-update t
;;         auto-package-update-interval 14))

(eval-when-compile
  (require 'use-package))

(require 'org)
(setq vc-follow-symlinks t)
(org-babel-load-file "~/dotfiles/emacs/.emacs.d/config.org")
