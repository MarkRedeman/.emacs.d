;;; .emacs --- Andrea Turso Emacs configuration file

;;; Created: 2012-09-04
;;;
;;; Changelog
;;;
;;; - 2014-09-11
;;;   Reorganised various setq blocks into the ofc/emacs-setup procedure.
;;;
;;; - 2014-09-14
;;;   Broken down this file into bindings.el, defuns.el and hooks.el

(when (fboundp 'fringe-mode)
  (fringe-mode -1))

(when (fboundp 'tooltip-mode)
  (tooltip-mode -1))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(when (fboundp 'auto-save-mode)
  (auto-save-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(when (fboundp 'bling-cursor-mode)
  (blink-cursor-mode -1))

(when (and (fboundp 'toggle-frame-maximized) window-system)
  (toggle-frame-maximized))

(load "~/.emacs.d/hooks")
(load "~/.emacs.d/bindings")
(load "~/.emacs.d/defuns")

;; Autoload php mode only when php files are opened
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(autoload 'feature-mode "feature-mode" "Mode that supports Cucumber syntax." t)

;; add file associations
(push '("\\.p?html" . web-mode) auto-mode-alist)
(push '("\\.twig" . web-mode) auto-mode-alist)
(push '("\\.feature" . feature-mode) auto-mode-alist)
(push '("\\.markdown" . markdown-mode) auto-mode-alist)
(push '("\\.php" . php-mode) auto-mode-alist)
(push '("\\.Rakefile\\|.rb" . ruby-mode) auto-mode-alist)
(push '("\\.coffee" . coffee-mode) auto-mode-alist)

;; Remove trailing whitespaces when saving files
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(add-hook 'after-save-hook 'ofc/dot-emacs-autocompile)

(add-hook 'ido-minibuffer-setup-hook 'ofc/ido-minibuffer-hook)
(add-hook 'php-mode-hook 'ofc/php-mode-hook)
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/themes")

;; Emacs specific setup
(ofc/setup)
(ofc/custom)

;; I think I should autoload the packages below as well.
(require 'package)
(require 'web-mode)
(require 'coffee-mode)
(require 'sr-speedbar)
(require 'php-extras)

;;(load-theme 'zenburn)
(load-theme 'wombat)

;; Initialise Emacs package management.
(package-initialize)

;; Mode specific loading and setup
(ofc/ido)
(ofc/keybindings)

(eval-after-load 'sql '(lambda () (sql-set-product 'mysql)))
;;(eval-after-load 'php-mode (require 'php-extras))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   (quote
    ("3c9d994e18db86ae397d077b6324bfdc445ecc7dc81bb9d528cd9bba08c1dac1" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
