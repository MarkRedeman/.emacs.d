;;; Emacs Key Bindings

;;; Created: 2014-09-14
;;;
;;;
;;; Changelog
;;;
;;; 2014-09-14
;;; - First revision of this file.
;;;
;;; 2014-09-14
;;; - Added company mode to php-mode.
;;;
;;; 2014-09-16
;;; - Added require-final-newline to php-mode to ensure all files end with a newline char.

(defun ofc/ido-minibuffer-hook nil
  "Ido minibuffer hook"
  (defvar resize-minibuffer-window-max-height)

  (make-local-variable 'resize-minibuffer-window-max-height)
  (setq resize-minibuffer-window-max-height 1))

(defun ofc/php-mode-hook nil
  "Configure php-mode"
  (company-mode)
  (setq require-final-newline t)
  (yas-minor-mode))

;; Reload the snippets (once) after yasnippet is loaded.
(eval-after-load 'yasnippet (lambda () (yas-reload-all)))