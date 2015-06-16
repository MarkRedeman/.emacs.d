(require 'ofc-tags)
(require 'php-mode)
(require 'ede-php-autoload-mode)

(defvar ofc-php-tags-find-functions-alist nil
  "A list of functions that can be used to resolve PHP tag names")

(global-ede-mode 1)

(add-hook 'php-mode-hook #'ede-php-autoload-mode)

(defun ofc/visit-class-file-at-point ()
  "Call this function on a Fully Qualified Name to visit its source file."
  (interactive)
  (let* ((class-name (replace-regexp-in-string "^\\\\" "" (thing-at-point 'sexp)))
         (class-file (ede-php-autoload-find-class-def-file (ede-current-project) class-name)))
    (message "Class %s %s" class-name class-file)
    (when class-file
      (xref-push-marker-stack)
      (find-file class-file))))

(defun ofc/php-tags-find-at-point ()
  "If called on a FQN visits the class, otherwise searches using helm-etags+"
  (interactive)
  (unless (ofc/visit-class-file-at-point)
    (ofc/tags-find-at-point)))

(define-key php-mode-map (kbd "M-.") 'ofc/php-tags-find-at-point)

(provide 'ofc-php-tags)
