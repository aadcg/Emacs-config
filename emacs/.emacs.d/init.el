(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Initialize packages installed with package.el
(unless package--initialized
  (package-initialize))

(defvar in-termux-p
  (and (equal (system-name) "localhost")
       (not (equal user-login-name "aadcg")))
  "If non-nil, GNU Emacs is running on Termux.")

;; Make sure `use-package' is available.
;; Useless if I use guix
(when in-termux-p
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)))

(setq use-package-hook-name-suffix nil
      ;; use-package-verbose t
      ;; use-package-compute-statistics t
      )

;; auto-update for the package.el package manager
;; (use-package auto-package-update
;;   :ensure t
;;   :config
;;   (auto-package-update-maybe)
;;   (setq auto-package-update-prompt-before-update t
;;         auto-package-update-interval 14))

(setq vc-follow-symlinks t)
(org-babel-load-file "~/dotfiles/emacs/.emacs.d/config.org")
