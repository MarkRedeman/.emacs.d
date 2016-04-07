(require 'company)

(unless (featurep 'company)
  (error "Package `company-mode' is required. Install from MELPA."))

(global-set-key (kbd "M-n") 'company-complete)

(setq company-dabbrev-downcase nil)
(global-company-mode t)

(diminish 'company-mode " Cm")

(provide 'ofc-company)
