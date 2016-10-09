;; org-mode hooks
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'flyspell-mode)

(setq org-clock-idle-time 10)

;; enable reftex
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; customize latex to pdf process to use bibtex
(setq org-latex-pdf-process '("pdflatex -interaction nonstopmode -output-directory %o %f"
                              "bibtex `basename %b`"
                              "pdflatex -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -interaction nonstopmode -output-directory %o %f"
                              "rm %b.bbl %b.blg"
                              "rm %b.tex"))

;; org-mode export to odt and doc formats
(require 'ox-odt)

;; color in sources inside org-files
(setq org-src-fontify-natively t)

;; org-reveal for presentations
(require 'ox-reveal)

;; org-page
(require 'org-page)
