(require 'ofc-tags)
(require 'php-mode)
(require 'ede-php-autoload-mode)
(require 'grammar-setup)
;; (load "~/Dev/joris-semantic-php/loaddefs.el")

(global-ede-mode 1)

(add-hook 'php-mode-hook #'ede-php-autoload-mode)
(add-to-list 'company-semantic-modes 'php-mode)

(defun ofc/visit-class-file-at-point ()
  "Maps a FQN into a file name using PHP autoload resolution."
  (interactive)
  (let* ((class-name (replace-regexp-in-string "^\\\\" "" (thing-at-point 'sexp)))
         (class-file (ede-php-autoload-find-class-def-file (ede-current-project) class-name)))
    (when class-file
      (xref-push-marker-stack)
      (find-file class-file))))

(defun ofc/php-tags-find-at-point ()
  "When called on a FQN, it resolves its name and jumps to the file where it's defined.
When called on anything else it forwards the call to a tag search function."
  (interactive)
  (unless (ofc/visit-class-file-at-point)
    (ofc/tags-find-at-point)))

(define-key php-mode-map (kbd "M-.") 'ofc/php-tags-find-at-point)

(provide 'ofc-php-tags)
