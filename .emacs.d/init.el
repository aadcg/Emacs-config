(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Bootstrap use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (auto-package-update-maybe))

(setq use-package-compute-statistics t)

(org-babel-load-file "~/.emacs.d/config.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel-docker zenburn-theme which-key use-package typit smex smartparens rainbow-delimiters projectile pretty-mode org-tree-slide org-pdfview org-bullets ob-ipython ob-go moody minions magit htmlize haskell-mode google-translate gitlab-ci-mode flycheck exwm expand-region elpy ein dockerfile-mode docker diff-hl default-text-scale csv-mode counsel company-jedi company-go command-log-mode cdlatex beacon avy auto-package-update auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-ellipsis ((t (:foreground "gray70" :underline nil)))))
