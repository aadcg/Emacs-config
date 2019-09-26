(setq user-full-name "André Alexandre Gomes"
      user-mail-address "andremegafone@gmail.com"
      calendar-latitude 41.16
      calendar-longitude -8.63
      calendar-location-name "Porto, PT"
      ;; calendar-latitude 59.94
      ;; calendar-longitude 30.31
      ;; calendar-location-name "Санкт-Петербург"
      )

(defun config-visit ()
  "Visits ~/.emacs.d/config.org."
  (interactive)
  (find-file "~/.emacs.d/config.org"))

(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  "Reloads ~/.emacs.d/config.org at runtime."
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(global-set-key (kbd "C-c r") 'config-reload)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-subword-mode t)
(delete-selection-mode t)
(setq require-final-newline t)
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default indent-tabs-mode nil)
(when (cl-search "termux" abbreviated-home-dir)
  (global-visual-line-mode t))

(setq scroll-preserve-screen-position 'always)
(save-place-mode 1)
(when window-system
  (setq blink-cursor-mode nil))

(global-auto-revert-mode t)
(setq auto-revert-remote-files t)
(substitute-key-definition 'kill-buffer 'kill-buffer-and-window global-map)

(setq temporary-file-directory (concat user-emacs-directory "backups/")
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(defun reset-text-size ()
  (interactive)
  (text-scale-set 0))

(defun switch-to-agenda ()
  (interactive)
  (switch-to-buffer "*Org Agenda*"))

(defun switch-to-presentation ()
  (interactive)
  (switch-to-buffer "slides.org"))

(global-set-key (kbd "C-0")     'reset-text-size)
(global-set-key (kbd "C-+")     'text-scale-increase)
(global-set-key (kbd "C--")     'text-scale-decrease)
(global-set-key (kbd "M-g")     'goto-line)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-%")     'query-replace-regexp)
(global-set-key (kbd "<f5>")    'revert-buffer)
(global-set-key (kbd "C-M-r")   'eval-buffer)
(global-set-key (kbd "C-x w")   'eww)
(global-set-key (kbd "C-x f")   'browse-url-firefox)
(global-set-key (kbd "S-SPC")   'cycle-spacing)
(global-set-key (kbd "M-SPC")   'other-window)
(global-set-key (kbd "C-c f")   'switch-to-agenda)
(global-set-key (kbd "C-<up>")   'switch-to-presentation)
(global-set-key (kbd "M-o")     'mode-line-other-buffer)

(setq browse-url-browser-function '((".*youtube.*"
                                     . browse-url-default-browser)
                                    (".*cliente*"
                                     . browse-url-default-browser)
                                    (".*checkin*"
                                    . browse-url-default-browser)
                                    ("." . eww-browse-url)))
(add-hook 'eww-mode-hook 'visual-line-mode)

(setq inhibit-startup-message t
      initial-scratch-message nil)
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(column-number-mode)
(setq-default dired-listing-switches "-Atlh")
(setq dired-auto-revert-buffer t)
(menu-bar-mode -1)
(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (horizontal-scroll-bar-mode -1)
  (global-hl-line-mode)
  (fringe-mode '(5 . 0)))

(setq default-input-method "russian-computer")

(setq calendar-week-start-day 1)

(setq display-time-24hr-format t
      display-time-format "%k:%M %a %d %b"
      display-time-default-load-average nil
      display-time-world-list '(("Europe/Moscow" "Москва")
                                ("Europe/Lisbon" "Lisboa")))
(display-time-mode 1)

(setq holiday-bahai-holidays nil
      holiday-oriental-holidays nil
      holiday-islamic-holidays nil
      holiday-hebrew-holidays nil
      holiday-christian-holidays nil

      holiday-general-holidays
      '(;; Portuguese Public Holidays
        (holiday-fixed 1 1 "Ano Novo")
        (holiday-easter-etc -47 "Carnaval")
        (holiday-easter-etc -2 "Sexta-feira Santa")
        (holiday-easter-etc 0 "Domingo de Páscoa")
        (holiday-fixed 3 19 "Dia do Pai")
        (holiday-fixed 4 25 "Dia da Liberdade")
        (holiday-fixed 5 1 "Dia do Trabalhador")
        (holiday-easter-etc +60 "Corpo de Deus")
        (holiday-float 5 0 1 "Dia da Mãe")
        (holiday-fixed 6 10 "Dia de Portugal, de Camões e das Comunidades Portuguesas")
        (holiday-fixed 8 15 "Assunção de Nossa Senhora")
        (holiday-fixed 10 5 "Implantação da República")
        (holiday-fixed 11 1 "Dia de Todos-os-Santos")
        (holiday-fixed 12 1 "Restauração da Independência")
        (holiday-fixed 12 8 "Imaculada Conceição")
        (holiday-fixed 12 25 "Natal")

        ;; Russian Public Holidays
        (holiday-fixed 1 1 "Новый год")
        (holiday-fixed 1 2 "Новогодние каникулы")
        (holiday-fixed 1 3 "Новогодние каникулы")
        (holiday-fixed 1 4 "Новогодние каникулы")
        (holiday-fixed 1 5 "Новогодние каникулы")
        (holiday-fixed 1 6 "Новогодние каникулы")
        (holiday-fixed 1 7 "Рождество Христово")
        (holiday-fixed 1 8 "Новогодние каникулы")
        (holiday-fixed 2 23 "День защитника Отечества")
        (holiday-fixed 3 8 "Международный женский день")
        (holiday-fixed 5 1 "Праздник Весны и Труда")
        (holiday-fixed 5 9 "День Победы")
        (holiday-fixed 6 12 "День России")
        (holiday-fixed 11 4 "День народного единства")

        ;; American Public Holidays
        ;; (holiday-float 1 1 3 "Martin Luther King Day")
        ;; (holiday-fixed 2 2 "Groundhog Day")
        (holiday-fixed 2 14 "Valentine's Day")
        ;; (holiday-float 2 1 3 "President's Day")
        ;; (holiday-fixed 3 17 "St. Patrick's Day")
        (holiday-fixed 4 1 "April Fools' Day")
        ;; (holiday-float 5 0 2 "Mother's Day")
        ;; (holiday-float 5 1 -1 "Memorial Day")
        ;; (holiday-fixed 6 14 "Flag Day")
        ;; (holiday-float 6 0 3 "Father's Day")
        ;; (holiday-fixed 7 4 "Independence Day")
        ;; (holiday-float 9 1 1 "Labor Day")
        ;; (holiday-float 10 1 2 "Columbus Day")
        (holiday-fixed 10 31 "Halloween")
        ;; (holiday-fixed 11 11 "Veteran's Day")
        ;; (holiday-float 11 4 4 "Thanksgiving")
        )

      holiday-other-holidays
      '(;; Days Off for 2019
        ;; (holiday-fixed 12 24 "Day Off")
        ;; (holiday-fixed 12 26 "Day Off")

        ;; Company Holidays for 2019
        ;; (holiday-fixed 7 19 "Company Holiday")
        )

        holiday-local-holidays
        '(;; Porto, PT
          (holiday-fixed 6 24 "Dia de São João")))

(use-package org
  :config
  (setq org-special-ctrl-a/e t
        org-special-ctrl-k t
        org-cycle-global-at-bob t
        org-goto-auto-isearch nil
        org-M-RET-may-split-line '((default . nil))
        org-list-demote-modify-bullet '(("-" . "+") ("+" . "-"))
        org-list-indent-offset 1
        org-return-follows-link t
        org-directory "~/NextCloud/org/"
        org-agenda-files '("~/NextCloud/org")
        org-agenda-skip-deadline-prewarning-if-scheduled t
        org-agenda-include-diary t
        org-agenda-span 10
        org-agenda-start-on-weekday nil
        org-todo-keywords '((sequence "TODO(t!)"
                                      "WIP(s!)"
                                      "WAITING(w@)"
                                      "|"
                                      "DONE(d!)"
                                      "NOT TODO(n@)"
                                      "CANCELED(c@)"))
        org-todo-keyword-faces '(("WIP" . "orange")
                                 ("WAITING" . "yellow"))
        org-refile-targets '((org-agenda-files :maxlevel . 5))
        org-refile-allow-creating-parent-nodes t
        orgtbl-mode t)

  :bind
  ("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c !" . org-time-stamp-inactive)
  ("C-c j" . aadcg/org-checkbox-next)
  ("<mouse-1>" . aadcg/org-checkbox-next))

(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-src-window-setup 'current-window
      org-confirm-babel-evaluate nil)

(use-package ob-ipython
  :defer t)

(use-package ob-go)

(require 'org-tempo)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python     . t)
   (ipython    . t)
   (haskell    . t)
   (go         . t)
   (latex      . t)
   (shell      . t)
   (ditaa      . t)))

(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("hs" . "src haskell"))
(add-to-list 'org-structure-template-alist '("go" . "src go"))
(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("co" . "comment"))

(require 'ox-beamer)
(add-to-list 'org-latex-packages-alist '("newfloat" "minted"))
(setq org-latex-listings 'minted)

(use-package cdlatex
  :init
  (org-cdlatex-mode))

(when window-system
  (use-package org-pdfview))

(defun aadcg/org-checkbox-next ()
  "Mark checkboxes and sort"
  (interactive)
  (let ((home (point)))
    (when (org-at-item-checkbox-p)
      (org-toggle-checkbox)
      (org-sort-list nil ?x))
    (goto-char home)))

(defun aadcg/org-replace-link-by-link-description ()
  "Replace an org link by its description or if empty its
address. Credit to
[[https://emacs.stackexchange.com/questions/10707/in-org-mode-how-to-remove-a-link][Andrew
Swann]]"
  (interactive)
  (if (org-in-regexp org-bracket-link-regexp 1)
      (let ((remove (list (match-beginning 0) (match-end 0)))
        (description (if (match-end 3)
                 (org-match-string-no-properties 3)
                 (org-match-string-no-properties 1))))
    (apply 'delete-region remove)
    (insert description))))

(use-package org-tree-slide
  :config
  (setq org-tree-slide-slide-in-effect nil
        org-tree-slide-cursor-init nil
        org-tree-slide-never-touch-face t
        org-tree-slide-activate-message "Welcome to my presentation!"
        org-tree-slide-deactivate-message "Hope you have enjoyed!")
  :hook
  ((org-tree-slide-play . aadcg/presenting)
   (org-tree-slide-stop . aadcg/non-presenting))
  :bind
  ("<f8>" . org-tree-slide-mode)
  ("<f7>" . org-tree-slide-play-with-timer)
  ("C->" . org-tree-slide-move-next-tree)
  ("C-<" . org-tree-slide-move-previous-tree))

(defun aadcg/presenting ()
  "Presenting mode"
  (interactive)
  (transparency 100)
  (display-time-mode 0)
  (column-number-mode 0)
  (line-number-mode 0)
  (display-battery-mode 0)
  (global-diff-hl-mode 0)
  (setq global-hl-line-mode nil)
  (default-text-scale-increase)
  (default-text-scale-increase)
  (default-text-scale-increase))

(defun aadcg/non-presenting ()
  "Non-presenting mode"
  (interactive)
  (transparency 90)
  (display-time-mode)
  (column-number-mode)
  (line-number-mode)
  (display-battery-mode)
  (reset-text-size)
  (global-diff-hl-mode)
  (global-hl-line-mode)
  (delete-other-windows)
  (default-text-scale-reset))

(setq org-ellipsis " §"
      org-hide-leading-stars t
      org-startup-indented t
      org-startup-with-inline-images t
      org-image-actual-width 500
      ;; org-hide-emphasis-markers t
      org-highlight-latex-and-related (quote (latex script entities))
      org-format-latex-options
      (quote (:foreground default :background default :scale 2.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                          ("begin" "$1" "$" "$$" "\\(" "\\["))))

(custom-set-faces '(org-ellipsis ((t (:foreground "gray70" :underline nil)))))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("▹")))

(use-package elpy
  :init
  (elpy-enable)

  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"
        python-shell-prompt-detect-failure-warning nil
        pyvenv-activate "~/anaconda3"
        pyvenv-mode-line-indicator nil)

  :bind
  ("C-c p" . elpy-autopep8-fix-code)
  ("C-c b" . elpy-black-fix-code))

(use-package company-jedi
  :config (add-to-list 'company-backends 'company-jedi))

(use-package ein)

(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))

(add-hook 'python-mode-hook
          (setq-default electric-indent-inhibit t))

(use-package haskell-mode)

(add-hook 'haskell-mode-hook
          (lambda ()
            (haskell-doc-mode)
            (turn-on-haskell-indent)))

(use-package go-mode
  :bind ("C-c s" . gofmt))

(use-package company-go
  :defer t
  :config (add-to-list 'company-backends 'company-go))

(use-package auctex
  :defer t
  :config
  (setq TeX-auto-save t
        TeX-parse-self t)
  (setq-default TeX-master nil))

;; (add-hook 'js-mode-hook 'json-pretty-print-buffer-ordered)

(eval-after-load 'comint
  '(progn
     ;; originally on C-c M-r and C-c M-s
     (define-key comint-mode-map (kbd "M-p") #'comint-previous-matching-input-from-input)
     (define-key comint-mode-map (kbd "M-n") #'comint-next-matching-input-from-input)
     ;; originally on M-p and M-n
     (define-key comint-mode-map (kbd "C-c M-r") #'comint-previous-input)
     (define-key comint-mode-map (kbd "C-c M-s") #'comint-next-input)))

(define-key shell-mode-map (kbd "SPC") 'comint-magic-space)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

(add-hook 'eshell-mode-hook
  (lambda ()
    (define-key eshell-mode-map (kbd "<M-tab>") nil)
    (define-key eshell-mode-map (kbd "<tab>")
      (lambda () (interactive) (completion-at-point)))))

(setq eshell-history-file-name "~/.bash_history"
      eshell-history-size 9999)

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package csv-mode)

(use-package gitlab-ci-mode
  :defer t)

(use-package dockerfile-mode)

(use-package projectile
  :init
  (projectile-mode 1))

(use-package magit
  :config
  (setq magit-display-buffer-function
        (quote magit-display-buffer-same-window-except-diff-v1))
  :bind
  ("C-x g" . magit-status))

(use-package diff-hl
  :config
  (global-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package pretty-mode
  :config
  (require 'pretty-mode)
  ;; (global-pretty-mode t)
  (pretty-activate-groups
   '(:sub-and-superscripts :arithmetic-nary :quantifiers :types)))

(use-package docker
  :bind ("C-c d" . docker))

(use-package docker-tramp)

(use-package counsel-docker)

(use-package flycheck
  :init
  (global-flycheck-mode t))

(when window-system
  (use-package flyspell
    :defer t
    :config
    (flyspell-prog-mode)))
    ;; (when org-mode-hook
    ;;   (flyspell-mode-off))))

(when window-system
  (use-package pdf-tools
    :config
    (pdf-tools-install)
    (setq pdf-view-midnight-colors '("#d2c8c8" . "#3F3F3F"))
    :hook
    (pdf-tools-enabled . pdf-view-midnight-minor-mode)
    (pdf-tools-enabled . pdf-view-auto-slice-minor-mode)
    (pdf-tools-enabled . pdf-view-fit-height-to-window)))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode)
  (show-smartparens-global-mode)
  (sp-local-pair 'org-mode "$$" "$$"))

(use-package avy
  :bind ("C-r" . avy-goto-word-1))

(use-package expand-region
  :bind ("C-=". 'er/expand-region))

(use-package counsel
  :init
  (ivy-mode 1)
  (counsel-mode)

  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d "
        ivy-wrap t
        ivy-extra-directories nil
        ivy-initial-inputs-alist nil
        ivy-height-alist
        '((t
           lambda (_caller)
           (/ (window-height) 2))))
  (add-to-list 'ivy-format-functions-alist '(t . ivy-format-function-arrow))

  :bind
  ("C-x B" . ivy-switch-buffer-other-window)
  ("C-s" . swiper))

(use-package smex)

(use-package company
  :config
  (global-company-mode t)
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 3)
  (define-key company-active-map (kbd "C-j") 'company-complete-selection)
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package typit
  :defer t)

(use-package command-log-mode
  :config
  (setq command-log-mode-auto-show t
        clm/log-command-indentation 8))

(use-package which-key
  :config (which-key-mode))

(use-package default-text-scale
  :config (default-text-scale-mode))

(use-package google-translate
  :config
  (require 'google-translate-default-ui)
  (global-set-key (kbd "C-c t") 'google-translate-at-point)
  (global-set-key (kbd "C-c T") 'google-translate-query-translate)
  (setq google-translate-backend-method 'curl))

;; (require 'google-translate)
;; (require 'google-translate-default-ui)
;; (global-set-key (kbd "C-c t") 'google-translate-at-point)
;; (global-set-key (kbd "C-c T") 'google-translate-query-translate)
;; (setq google-translate-backend-method 'curl)

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque."
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(global-set-key (kbd "C-x t") 'transparency)

(use-package zenburn-theme
  :init
  (setq zenburn-scale-org-headlines t
        zenburn-height-plus-2 1.3
        zenburn-height-plus-3 1.5
        zenburn-height-plus-4 1.7)
  (load-theme 'zenburn t)
  (transparency 90))

(when window-system
  (use-package moody
    :config
    (setq moody-mode-line-height 25
          x-underline-at-descent-line t)
    (moody-replace-mode-line-buffer-identification)
    (moody-replace-vc-mode)))

(unless (cl-search "termux" abbreviated-home-dir)
  (display-battery-mode)
  (setq battery-mode-line-format " %p%"
        battery-mode-line-limit 99))

(use-package minions
  :config
  (setq minions-mode-line-lighter ""
        minions-mode-line-delimiters '("" . "")
        minions-direct '(org-tree-slide-mode text-scale-mode))
  (minions-mode 1))

(when window-system
  (use-package beacon
  :config
  (beacon-mode 1)
  (setq beacon-blink-when-window-scrolls nil)))

(use-package htmlize)

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(when window-system
  (toggle-frame-fullscreen))

(org-agenda-list 1)
(delete-other-windows)
