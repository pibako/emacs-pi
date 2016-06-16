;; Magit
(require 'magit)
(set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/24.5/bin/emacsclient")
(define-key global-map (kbd "C-x g") 'magit-status)

(global-git-gutter-mode t)

(global-set-key (kbd "C-c p") 'magit-find-file-completing-read)
(global-set-key (kbd "C-c v") 'vc-git-grep)

(setq git-messenger:show-detail t)
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)

;; (setq magit-last-seen-setup-instructions "1.4.0")
