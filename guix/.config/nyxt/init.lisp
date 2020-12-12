(defvar *my-keymap* (make-keymap "my-map"))
(define-key *my-keymap*
  "C-s"     'nyxt/web-mode:search-buffer
  "C-j"     'nyxt/web-mode:follow-hint
  "C-J"     'nyxt/web-mode:follow-hint-new-buffer
  "C-g"     'nyxt/web-mode:remove-search-hints
  "C-u C-J" 'nyxt/web-mode:follow-hint-new-buffer-focus
  ;; this doesn't work because there are no keybindings maps
  ;; "C-j"     'nyxt/minibuffer-mode:return-selection
  ;; "C-x C-b" 'nyxt:list-buffers
  ;; "M-b" 'nyxt/input-edit-mode:cursor-backwards-word
  ;; "M-f" 'nyxt/input-edit-mode:cursor-forwards-word
  ;; "C-b" 'nyxt/input-edit-mode:cursor-backwards
  ;; "C-f" 'nyxt/input-edit-mode:cursor-forwards
  "menu" 'nyxt:execute-command)

(define-mode my-mode ()
  "Dummy mode for the custom key bindings in `*my-keymap*'."
  ((keymap-scheme :initform (keymap:make-scheme
                             scheme:emacs *my-keymap*))))

(define-configuration (buffer web-buffer)
  ((default-modes (append '(emacs-mode my-mode)
                            %slot-default))
   (current-zoom-ratio 1.5)
   (zoom-ratio-default 1.5)
   (conservative-word-move t)))

(define-configuration web-buffer
  ((default-modes (append
                   '(blocker-mode
                     force-https-mode
                     ;; noimage-mode
                     ;; noscript-mode
                     proxy-mode)
                   %slot-default))
   (default-new-buffer-url "https://github.com/aadcg")))

;; (setf nyxt/certificate-exception-mode:*default-certificate-exceptions*
;;        '("your.unacceptable.cert.website"))

;; for dev purposes
(load-after-system :slynk "/home/aadcg/dotfiles/guix/.config/nyxt/my-slink.lisp")

(define-configuration minibuffer
  ((max-lines 8)
   (minibuffer-style #.(cl-css:css
                        '((* :font-family "monospace,monospace"
                             :font-size "18px"
                             :line-height "22px")
                          (body :border-top "4px solid dimgray"
                                :margin "0"
                                :padding "0 6px")
                          ("#container" :display "flex"
                                        :flex-flow "column"

                                        :height "100%")
                          ("#input" :padding "6px 0"
                                    :border-bottom "solid 1px lightgray")
                          ("#suggestions" :flex-grow "1"
                                          :overflow-y "auto"
                                          :overflow-x "auto")
                          ("#cursor" :background-color "gray"
                                     :color "white")
                          ("#prompt" :padding-right "4px"
                                     :color "dimgray")
                          (ul :list-style "none"
                              :padding "0"
                              :margin "0")
                          (li :padding "2px")
                          (.marked :background-color "darkgray"
                                   :font-weight "bold"
                                   :color "white")
                          (.selected :background-color "gray"
                                     :color "white")))
                     :documentation "The CSS applied to a minibuffer when it is set-up.")))

;; (define-configuration window
;;   ((message-buffer-height 24)
;;    (message-buffer-style (cl-css:css
;;                           '((body
;;                              :font-size "24x"
;;                              :padding 0
;;                              :padding-left "4px"
;;                              :margin 0))))))

;; https://github.com/jmercouris/configuration/blob/master/.config/nyxt/init.lisp
