(require 'magit)
(require 'git-timemachine)

(set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/HEAD/bin/emacsclient")
(setq magit-status-buffer-switch-function 'switch-to-buffer)

;; Bind magit related commands to prefix `C-x g'.
(global-set-key (kbd "C-x g s") 'magit-status)
(global-set-key (kbd "C-x g b") 'magit-branch-manager)
(global-set-key (kbd "C-x g l") 'magit-log)
(global-set-key (kbd "C-x g c") 'magit-checkout)
(global-set-key (kbd "C-x g :") 'magit-git-command)
(global-set-key (kbd "C-x g t") 'git-timemachine)

(provide 'ofc-magit)
