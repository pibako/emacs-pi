;; ispell and flyspell for message
(add-hook 'message-send-hook 'ispell-message)

(defun my-message-setup-routine ()
  (flyspell-mode 1))
(add-hook 'message-setup-hook 'my-message-setup-routine)

;; gnus imap search
(require 'nnir)

;; start gnus
;; (gnus)

(require 'external-abook)
(setq external-abook-command "contacts -lSf '%%e\t\"%%n\"' '%s'")
;; (setq external-abook-command "contacts -lf '%%e\t%%n' %s")
(eval-after-load "message"
  '(progn
     (add-to-list 'message-mode-hook
                  '(lambda ()
                     (define-key message-mode-map "\C-c\t" 'external-abook-try-expand)))))
