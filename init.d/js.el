;; coffee
(defun coffee-custom ()
  "This is a coffee-mode-hook."
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;; js-mode set indentation to 2
(setq js-indent-level 2)

(setq inferior-js-program-command "/usr/local/bin/rhino")
