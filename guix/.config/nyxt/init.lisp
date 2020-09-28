(defvar *my-keymap* (make-keymap "my-map"))
(define-key *my-keymap*
  "C-j" 'nyxt/web-mode:follow-hint
  "C-J" 'nyxt/web-mode:follow-hint-new-buffer
  "C-u C-J" 'nyxt/web-mode:follow-hint-new-buffer-focus
  "C-x C-b" 'nyxt:list-buffers)

(define-mode my-mode ()
  "Dummy mode for the custom key bindings in `*my-keymap*'."
  ((keymap-scheme :initform (keymap:make-scheme
                             scheme:emacs *my-keymap*))))

(define-configuration (buffer web-buffer)
  ((default-modes (append '(emacs-mode my-mode) %slot-default))
   (current-zoom-ratio 1.75)
   (zoom-ratio-default 1.75)
   ))

;; (fullscreen-current-window)

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
