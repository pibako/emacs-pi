;; add skim as default pdf viewer for tex
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-source-correlate-method 'synctex)
(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-expand-list
                         '("%q" skim-make-url))))

(defun skim-make-url ()
  (concat
   (TeX-current-line)
   " "
   (expand-file-name (funcall file (TeX-output-extension) t)
                     (file-name-directory (TeX-master-file)))
   " "
   (buffer-file-name)))
(setq TeX-view-program-list
      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %q")))
(setq TeX-view-program-selection '((output-pdf "Skim")))

;; enabled auto-fill mode in text-mode and all related modes
(add-hook 'text-mode-hook 'turn-on-auto-fill)
