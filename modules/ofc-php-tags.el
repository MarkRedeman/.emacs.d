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
  (save-excursion
    (let* ((class-name (thing-at-point 'sexp))
           (class-file (ede-php-autoload-find-class-def-file (ede-current-project) class-name)))
      (if class-file
          (find-file class-file)
        nil))))

(defun ofc/php-tags-find-at-point (arg)
  "If called on a FQN visits the class, otherwise searches using helm-etags+"
  (interactive "P")
  (unless (ofc/visit-class-file-at-point)
    (ofc/tags-find-at-point arg)))

(define-key php-mode-map (kbd "M-.") 'ofc/php-tags-find-at-point)

(provide 'ofc-php-tags)
