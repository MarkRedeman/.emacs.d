(require 'php-mode)
(require 'php-extras)
(require 'ofc-comint-php)
(require 'ofc-php-tags)

(defun ofc/php-mode-hook ()
  "A custom PHP mode initialisation hook."
  (setq mode-name "PHP"
        php-lineup-cascaded-calls t)
  (set (make-local-variable 'require-final-newline) t))

(defun ofc/forward-word ()
  "Moves the point at the end of the next word or sexp."
  (interactive)

  (cond ((looking-at "{")
         (forward-sexp))

        ((looking-back "{")
         (backward-char 1)
         (forward-sexp))

        (t (forward-word))))

(defun ofc/backward-word ()
  "Moves the point at the beginning of the previous word or sexp."
  (interactive)

  (cond ((looking-back "}")
         (backward-sexp))

        ((looking-at "}")
         (forward-char 1)
         (backward-sexp))

        (t (backward-word))))

;; Activate the `ofc/php-mode-hook' to run my setup my customisations
;; to php-mode.
(add-hook 'php-mode-hook 'ofc/php-mode-hook)

;; Activate `flyspell-prog-mode' minor mode during PHP editing to
;; avoid spelling mistakes in comments and strings.
(add-hook 'php-mode-hook 'flyspell-prog-mode)

;; Activate the `ctags-auto-update-mode' which recreates the TAGS file
;; with exuberant ctags.
;;
;; This function is available since the introduction the
;; helm-etags-plus package.
(add-hook 'php-mode-hook 'ctags-auto-update-mode)

(define-key php-mode-map (kbd "M-n") 'company-complete)

;; Jump sexps (Blocks of braces in PHP .e.g { ... }) using M-f and M-b
(define-key php-mode-map (kbd "M-f") 'ofc/forward-word)
(define-key php-mode-map (kbd "M-b") 'ofc/backward-word)

;; Use php-mode to visiting .php files.
(push '("\\.php" . php-mode) auto-mode-alist)

(provide 'ofc-php)
