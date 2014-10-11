;;; Emacs Key Bindings

;;; Created: 2014-09-14
;;;
;;;
;;; Changelog
;;;
;;; 2014-09-14
;;; - First revision of this file.
;;; - C-c C-a marks the whole buffer (formerly C-x h).
;;;
;;; 2014-09-17
;;; - Bound C-o to yas-expand.
;;;
;;; 2014-09-18
;;; - Bound C-RET will now highlight symbols.
;;; - Up/Down arrows will navigate highlighted symbols.
;;;
;;; 2014-09-22
;;; - Bound C-x g to magit-status.
;;; - Bound C-x C-m to execute-extended-command (formerly M-x).
;;; - Inhibited Command key on Mac, Option is M(eta).
;;; - Right Option key should now let me input special chars on Mac.
;;; - Mapped M-g to goto-line-with-feedback.
;;; - Bound ESC to keyboard-quit (aka C-g).
;;;
;;; 2014-09-25
;;; - Bound C-x C-b (and C-x C-a, to see which binding is easier to
;;;   hit) to helm-mini. Helm-mini is a buffer switcher.
;;;

;; Custom global key bindings
(defun ofc/keybindings nil
  (when (eq system-type 'darwin)
    (progn
      ;; Bind the first character of the Mac keyboard as the speedbar
      ;; toggle.
      (global-set-key (kbd "§") 'sr-speedbar-toggle)

      ;; Option is meta (M).
      (setq mac-option-modifier 'meta)

      ;; Command is super (S).
      (setq mac-command-modifier 'none)

      ;; Let the right Alt be used for special characters.
      (setq mac-right-option-modifier 'none)))

  ;; Bind M-g to temporarily display line numbers when jumping to a
  ;; line.
  (when (fboundp 'ofc/goto-line-with-feedback)
    (global-set-key (kbd "M-g") 'ofc/goto-line-with-feedback))

  ;; Prompt before exiting, we don't want to abruptly terminate the
  ;; development session.
  (when window-system
    (global-set-key (kbd "C-x C-c") 'ofc/prompt-before-closing))

  ;; Bind C-/ to the comment line or region function which does pretty
  ;; much what it says on the tin.
  (when (fboundp 'comment-or-uncomment-line-or-region)
    (global-set-key (kbd "C-/") 'comment-or-uncomment-line-or-region))

  ;; Bind magit-status to C-x g.
  (global-set-key (kbd "C-x g") 'magit-status)

  ;; Treat ESC just like C-g.
  (global-set-key (kbd "<escape>") 'keyboard-quit)

  ;; Use Up/Down arrows to navigate the occurrences of the symbol
  ;; under the cursor across the current buffer.
  (global-set-key (kbd "<down>") 'highlight-symbol-next)
  (global-set-key (kbd "<up>") 'highlight-symbol-prev)

  ;; C-RET will highlight all occurrences of the symbol under the
  ;; cursor across the current buffer.
  (global-set-key (kbd "C-<return>") 'highlight-symbol-at-point)

  ;; M-RET will initiate the interactive replacement of all symbols
  ;; matching the one under the cursor across the current buffer.
  (global-set-key (kbd "M-<return>") 'highlight-symbol-query-replace)

  ;; Use helm-mini to switch between open buffer and files, or
  ;; recently closed ones.
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-a") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-mini)

  ;; Bind C-; to autocomplete with company in a helm buffer.
  ;; @note: What is the (non-obvious) difference between define-key and global-set-key?
  (global-set-key (kbd "C-;") 'helm-company)

  ;; Duplicate the M-x binding to C-x C-m for easier access.
  (global-set-key (kbd "C-x C-m") 'execute-extended-command)

  ;; Duplicate the C-x h binding to C-c a to select all the text in
  ;; the buffer.
  (global-set-key (kbd "C-c a") 'mark-whole-buffer)

  ;; Bind C-x a r to align the text in the region.
  (global-set-key (kbd "C-x a r") 'align-regexp))
