(require 'php-mode)
(require 'ofc-php-comint)
(require 'ede-php-autoload-mode)

;; Imports my experimental PHP language support.
(require 'grammar-setup)

(defun ofc/php-mode-hook ()
  "A custom PHP mode initialisation hook."
  (setq mode-name "PHP"
        php-lineup-cascaded-calls t)
  (set (make-local-variable 'require-final-newline) t))

(defun ofc/in-comment-or-string-p (point)
  "Returns t when the point is placed within a string or comment"
  (interactive)
  ;; Body of this defun was taken from Chen Bin's answer to
  ;; emacs.stackexchange.com/questions/14269
  (let ((fontfaces (get-text-property point 'face)))
    (when (not (listp fontfaces))
      (setf fontfaces (list fontfaces)))
    (delq nil
          (mapcar #'(lambda (f)
                      ;; learn this trick from flyspell
                      (or (eq f 'font-lock-comment-face)
                          (eq f 'font-lock-string-face)
                          (eq f 'font-lock-comment-delimiter-face)))
                  fontfaces))))

(defun ofc/forward-word ()
  "Moves the point at the end of the next word or sexp."
  (interactive)
  (cond ((and (looking-at "{")
              (not (ofc/in-comment-or-string-p (point))))
         (forward-sexp))

        ((and (looking-back "{")
              (not (ofc/in-comment-or-string-p (point))))
         (backward-char 1)
         (forward-sexp))

        (t (forward-word))))

(defun ofc/backward-word ()
  "Moves the point at the beginning of the previous word or sexp."
  (interactive)

  (cond ((and (looking-back "}")
              (not (ofc/in-comment-or-string-p (point))))
         (backward-sexp))

        ((and (looking-at "}")
              (not (ofc/in-comment-or-string-p (point))))
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
;; TODO update ofc/forward/backward-word to fallback in strings.
(define-key php-mode-map (kbd "M-f") 'ofc/forward-word)
(define-key php-mode-map (kbd "M-b") 'ofc/backward-word)

;; Use php-mode to visiting .php files.
(push '("\\.php" . php-mode) auto-mode-alist)

;; Enable Steven Remot's EDE customisations and type resolution based
;; on Composer information.
(add-hook 'php-mode-hook #'ede-php-autoload-mode)

;; Make sure Company treats php-mode as a Semantic mode.
(eval-after-load 'company-mode
  (add-to-list 'company-semantic-modes 'php-mode))

(global-ede-mode 1)

(define-key php-mode-map (kbd "M-.") 'ofc/php-tags-find-at-point)

(provide 'ofc-php)
