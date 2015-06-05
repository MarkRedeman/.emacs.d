(require 'web-mode)

(push '("\\.twig" . web-mode) auto-mode-alist)
(push '("\\.html" . web-mode) auto-mode-alist)
(push '("\\.jsx" . web-mode) auto-mode-alist)
(push '("\\.blade.php" . web-mode) auto-mode-alist)

(setq web-mode-enable-current-column-highlight t)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(add-hook 'web-mode-hook (lambda () (whitespace-mode -1)))

(provide 'ofc-web)
