(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(when in-termux-p
  (use-package use-package-ensure
  :config
  (setq use-package-always-ensure t)))

(use-package auto-package-update
  :ensure t
  :config
  (auto-package-update-maybe)
  (setq auto-package-update-prompt-before-update t
        auto-package-update-interval 14))

(org-babel-load-file "~/.emacs.d/config.org")
