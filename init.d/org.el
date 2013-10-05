;; org-mode hooks
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'flyspell-mode)

;; enable reftex
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; customize latex to pdf process to use bibtex
(setq org-latex-to-pdf-process '("pdflatex -interaction nonstopmode %b"
                                 "bibtex `basename %b`"
                                 "pdflatex -interaction nonstopmode %b"
                                 "pdflatex -interaction nonstopmode %b"
                                 "rm %b.bbl %b.blg"
                                 "rm %b.tex"))

;; org-mode export to odt and doc formats
(require 'ox-odt)
