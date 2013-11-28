;; delete whitespace and untabify
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun untabify-hook ()
  (let ((tab-sensitive-modes '(makefile-mode
                               makefile-automake-mode
                               makefile-gmake-mode
                               makefile-imake-mode
                               makefile-makepp-mode
                               makefile-bsdmake-mode)))
    (if (not (member major-mode tab-sensitive-modes))
        (untabify (point-min) (point-max)))))

(add-hook 'before-save-hook 'untabify-hook)

;; Add flyspell check in comments
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Enable camel case for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)

;; enable textmate-mode (it enables ido-mode)
;; (textmate-mode)
