;;; ofc-php-flymake.el --- Configures Flymake to work with PHP mode.

;;; Commentary:
;; Code taken from Sacha Chua's blog article "Emacs and PHP:
;; On-the-fly syntax checking with Flymake".

(require 'flymake)

;;; Code:

(defun ofc/php-flymake-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))

(add-to-list 'flymake-err-line-patterns
  '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" ofc/php-flymake-init))

(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)

(provide 'ofc-php-flymake)

;;; ofc-php-flymake.el ends here
