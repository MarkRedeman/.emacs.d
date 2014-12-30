(require 'php-mode)
(require 'php-extras)

(defun ofc/php-mode-hook ()
  ""
  (setq mode-name "PHP")
;  (ggtags-mode 1)
  (set (make-local-variable 'require-final-newline) t))

(add-hook 'php-mode-hook 'ofc/php-mode-hook)

(push '("\\.php" . php-mode) auto-mode-alist)

(provide 'ofc-php)