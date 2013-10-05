;; Enable ctags autoupdate
(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on `ctags-auto-update-mode'." t)
(setq tags-revert-without-query 1)      ; reload tags without yes-no query
(add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
(add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)
(add-hook 'ruby-mode-hook  'turn-on-ctags-auto-update-mode)
