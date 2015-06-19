;;; Emacs Key Bindings
(require 'ace-window)

;; Avoid accidentally suspending Emacs.
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-x m"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))

;; Treat ESC just like C-g.
(global-set-key (kbd "<escape>") 'keyboard-quit)

(global-set-key (kbd "M-p") 'ace-window)
