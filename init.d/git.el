;; Magit
(require 'magit)
(set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/24.3/bin/emacsclient")
(define-key global-map (kbd "C-x g") 'magit-status)

(global-git-gutter+-mode t)

(global-set-key (kbd "C-c p") 'magit-find-file-completing-read)
