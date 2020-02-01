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
    (emms google-translate default-text-scale typit smex counsel expand-region smartparens flycheck org-bullets org-tree-slide org-pdfview cdlatex htmlize ob-go ob-ipython projectile haskell-mode ein company-jedi elpy beacon hide-mode-line avy rainbow-delimiters zenburn-theme use-package moody minions magit guix gitignore-mode diff-hl auto-package-update))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-ellipsis ((t (:foreground "gray70" :underline nil)))))
