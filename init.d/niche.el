;; cool learning mode
(require 'cool-mode)
(add-to-list 'auto-mode-alist '("\.cool$" . cool-mode))

;; actionscript (flash)
(autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

;; cuda
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))
