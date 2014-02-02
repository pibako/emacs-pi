;; Use company-mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay nil)                ; do not complete automatically

;; Add company-inf-ruby backend (it works nicely inside inf-ruby mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-robe))
