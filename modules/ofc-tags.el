(require 'ctags-update)

(require 'php-mode)
(require 'ede-php-autoload-mode)
(require 'grammar-setup)

(defun ofc/php-tags-find-at-point ()
  "When called on a FQN, it resolves its name and jumps to the file where it's defined.
When called on anything else it forwards the call to a tag search function."
  (interactive)
  ;; Handle the switcheroo for PHP using the keybinding (i.e. bind
  ;; this to ofc/visit-class-file-at-point in php-mode-map.
  (unless (ofc/visit-class-file-at-point)
    (ofc/tags-find-at-point)))

(defun ofc/tags-find-at-point ()
  "Finds the definitions of the symbol at poing using a tag file."
  (interactive)
  (if (featurep 'xref-find-definitions)
      (xref-find-definitions (thing-at-point 'sexp)))
  (error "Emacs 25 is required to use xref-find-definitions."))

(defun ofc/visit-class-file-at-point ()
  "Maps a FQN into a file name using PHP autoload resolution."
  (interactive)
  ;; NOTE only useful in PHP.
  (let* ((class-name (replace-regexp-in-string "^\\\\" "" (thing-at-point 'sexp)))
         (class-file (ede-php-autoload-find-class-def-file (ede-current-project) class-name)))
    (message "looking up: %s" class-name)
    (when class-file
      (when (featurep 'xref-push-marker-stack)
        (xref-push-marker-stack))
      (find-file class-file))))

;; Don't pester me with confirmation dialogs in the minibuffer
;; before regenerating the bloody tags.
(setq tags-revert-without-query t)

;; Change the name of the auto update mode without
;; using diminish.
(setq ctags-update-lighter " CtU+")

;; TODO Set these keys only for progn-mode derived modes.
(global-set-key "\M-." 'ofc/tags-find-at-point)

;; Regenerate tags manually.
;; C-u to create a new TAGS file.
;; C-u C-u to copy the ctags command into the kill ring.
(global-set-key "\C-cE" 'ctags-update)

(provide 'ofc-tags)
