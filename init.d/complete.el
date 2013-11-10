;; Use company-mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; Add company-inf-ruby backend (it works nicely inside inf-ruby mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))

;; Enable robe (for Ruby)
(add-hook 'ruby-mode-hook 'robe-mode)
