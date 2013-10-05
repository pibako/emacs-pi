;; use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; configure groups
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("erc" (mode . erc-mode))
               ("gnus" (or
                        (mode . message-mode)
                        (mode . bbdb-mode)
                        (mode . mail-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")))
               ("javascript" (or
                              (name . "\\.jst\\.ejs\\'")
                              (name . "\\.jst\\.eco\\'")
                              (mode . coffee-mode)
                              (mode . js-mode)))
               ;; ("planner" (or
               ;;             (name . "^\\*Calendar\\*$")
               ;;             (name . "^diary$")
               ;;             (mode . muse-mode)))
               ("ruby" (or
                        (name . "\\.html\\.erb\\'")
                        (mode . ruby-mode)
                        (mode . inf-ruby-mode)))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))
