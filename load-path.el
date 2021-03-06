;;; .emacs --- Andrea Turso Emacs configuration file

;;; Created: 2012-09-04
;;;
;;; Changelog
;;;
;;; 2014-11-06
;;; - Created the load-path file to hold all paths configuration.
;;; - Added git-timemachine.
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/warm-night-theme")
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/gotham-theme")
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/eink-emacs")
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/emacs-leuven-theme")


(mapcar 'expand-file-name '("~/"))

(setq load-path (append
                 (mapcar 'expand-file-name
                         (list "~/.emacs.d/elisp/web-mode"
                               "~/.emacs.d/elisp/edep"
                               "~/Dev/my-semantic-php"
                               "~/.emacs.d/elisp/ede-php-autoload"
                               "~/.emacs.d/elisp/php-mode"
                               "~/.emacs.d/elisp/php-eldoc"
                               "~/.emacs.d/elisp/ecb"
                               "~/.emacs.d/elisp/helm-etags-plus"
                               "~/.emacs.d/elisp/cedet"
                               "~/.emacs.d/elisp/company-mode"
                               "~/.emacs.d/elisp/coffee-mode"
                               "~/.emacs.d/elisp/popwin"
                               "~/.emacs.d/elisp/projectile"
                               "~/.emacs.d/elisp/helm"
                               "~/.emacs.d/elisp/git-timemachine"
                               "~/.emacs.d/elisp/zenburn-theme"
                               "~/.emacs.d/elisp/yasnippet"
                               "~/.emacs.d/elisp/helm-ack"
                               "~/.emacs.d/elisp/ggtags"
                               "~/.emacs.d/elisp/grizzl"
                               "~/.emacs.d/elisp/highlight-symbol"))
                 load-path))
