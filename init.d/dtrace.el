;; D-Mode: Mode for editing DTrace D language.
(autoload 'd-mode "d-mode" () t)
(add-to-list 'auto-mode-alist '("\\.d\\'" . d-mode))

;; When loaded, runs all hooks from d-mode-hook
(add-hook 'd-mode-hook 'imenu-add-menubar-index)
(add-hook 'd-mode-hook 'font-lock-mode)
