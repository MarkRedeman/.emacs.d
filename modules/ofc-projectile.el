(require 'projectile)
(require 'helm-projectile)

(projectile-global-mode)
(setq projectile-mode-line '(:eval (format " <%s>" (projectile-project-name))))
;; The benefit of using `helm-projectile-switch-project', over `helm'
;; is that on any selected project we can fire many actions, not
;; limited to just the "switch to project" action.
(setq projectile-completion-system 'helm-projectile-switch-project
      projectile-switch-project-action 'helm-projectile-find-file)

(helm-projectile-on)

(provide 'ofc-projectile)
