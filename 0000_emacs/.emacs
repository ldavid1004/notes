
;; use command key as meta for aqauemacs

;;(setq mac-command-modifier 'meta)


( defun insert-pwd ()
  "Inserts the output from the pwd command at point"
  ( interactive )
  (insert
   ( substring (shell-command-to-string "pwd") 0 -1 )))

( global-set-key "\C-xp" 'insert-pwd )

( global-set-key "\C-xt" 'toggle-read-only )

( global-set-key "\C-xg" 'goto-line )

( global-set-key "\C-xw" 'what-line )

( global-set-key "\C-xf" 'forward-sexp )

(set 'tab-width 4 )
(set 'python-indent-offset 4)

;; add local elisp files to path
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; (global-set-key "\M-w" 'clipboard-kill-ring-save)
;; (global-set-key "\C-y" 'clipboard-yank)

;; (global-set-key "\C-cc" 'clipboard-kill-ring-save)
;; (global-set-key "\C-cv" 'clipboard-yank)

(cond 
 ((string-equal system-type "darwin") ; Mac OS X
  (when (member "Menlo" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "-*-Menlo-normal-normal-normal-*-21-*-*-*-m-0-iso10646-1"))
    (add-to-list 'default-frame-alist '(font . "-*-Menlo-normal-normal-normal-*-21-*-*-*-m-0-iso10646-1"))))
 ((string-equal system-type "cygwin") ; windows - cygwin
  (set-face-attribute 'default nil
                    :family "Consolas" :height 200)))

;; (set-default-font "-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
;; (set-default-font "-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
;; (set-default-font "-bitstream-bitstream vera sans mono-medium-r-*-*-*-120-*-*-*-*-*-*")
