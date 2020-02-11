(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defvar in-termux-p
  (and (equal (system-name) "localhost")
       (not (equal user-login-name "aadcg")))
  "t if using GNU Emacs on Termux")

(setq vc-follow-symlinks t)

(use-package use-package-ensure
  :config
  (setq use-package-always-ensure t))

(use-package auto-package-update
  :ensure t
  :config
  (auto-package-update-maybe)
  (setq auto-package-update-prompt-before-update t
        auto-package-update-interval 14))

(org-babel-load-file "~/.emacs.d/config.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (speed-type zenburn-theme wttrin use-package typit telega smex smartparens skewer-mode rainbow-delimiters projectile org-tree-slide org-pdfview org-drill-table org-drill org-bullets ob-ipython ob-go moody minions markdown-mode htmlize hide-mode-line haskell-mode guix google-translate gitignore-mode flycheck expand-region emojify emms elpy ein diff-hl default-text-scale counsel company-jedi cdlatex beacon avy auto-package-update auto-complete)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com" t)
 '(smtpmail-smtp-service 25 t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-ellipsis ((t (:foreground "gray70" :underline nil)))))
