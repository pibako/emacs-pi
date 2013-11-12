;; delete whitespace and untabify
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun untabify-hook ()
  (untabify (point-min) (point-max)))

(add-hook 'before-save-hook 'untabify-hook)

;; Add flyspell check in comments
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Enable camel case for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)

;; enable textmate-mode (it enables ido-mode)
;; (textmate-mode)
