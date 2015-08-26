(if (executable-find "psysh")
    (setq php-cli-path (executable-find "psysh")
          comint-prompt-regexp "^>>> *")
  (setq php-cli-path (executable-find "php")
        comint-prompt-regexp "^php +> *"))

(setq comint-use-prompt-regexp t)
(setq comint-prompt-read-only t)
(setq php-cli-arguments '())

(defun ofc/php-comint ()
  "Run an inferior instance of `php' inside Emacs."
  (interactive)
  (let ((php-program php-cli-path)
        (php-switches php-cli-arguments)
        (buffer (comint-check-proc "*php-repl*")))

    ;; create the comint process if there is no buffer.
    (unless buffer
      (apply 'make-comint-in-buffer "php" "*php-repl*" php-program nil php-switches))
    (pop-to-buffer "*php-repl*")))

(define-key php-mode-map (kbd "C-x C-r") 'ofc/php-comint)

(provide 'ofc-php-comint)
