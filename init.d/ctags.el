;; (require 'ctags)
;; (setq ctags-command "/usr/local/bin/ctags -e -R ")
;; (setq tags-revert-without-query 1)      ; reload tags without yes-no query
;; (global-set-key (kbd "<f7>") 'ctags-create-or-update-tags-table)

;; Enable ctags autoupdate
;; (autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on `ctags-auto-update-mode'." t)
;; (add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
;; (add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)
;; (add-hook 'ruby-mode-hook  'turn-on-ctags-auto-update-mode)
