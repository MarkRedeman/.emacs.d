(require 'ctags-update)

;; Don't pester me with confirmation dialogs in the minibuffer
;; before regenerating the bloody tags.
(setq tags-revert-without-query t)

(defun ofc/tags-find-at-point ()
  "Finds the definitions of the symbol at poing using a tag file."
  (interactive)
  (xref-find-definitions (thing-at-point 'sexp)))

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
