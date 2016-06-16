;; coffee
(defun coffee-custom ()
  "This is a coffee-mode-hook."
  (set (make-local-variable 'tab-width) 2)
  (lambda ()
    (set-fill-column 120)))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;; js-mode set indentation to 2
(setq js-indent-level 2)

(setq inferior-js-program-command "/usr/local/bin/rhino")

(defun custom-js ()
  (tern-mode t)                         ; Always run tern when in js-mode or js2-mode.
  (set-fill-column 120))                ; Set fill column to 120

(add-hook 'js-mode-hook 'custom-js)
(add-hook 'js2-mode-hook 'custom-js)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;;
(eval-after-load "js2-mode"
  '(progn
     (setq js2-missing-semi-one-line-override t)
     (setq-default js2-basic-offset 2) ; 2 spaces for indentation (if you prefer 2 spaces instead of default 4 spaces for tab)))

     ;; add from jslint global variable declarations to js2-mode globals list
     ;; modified from one in http://www.emacswiki.org/emacs/Js2Mode
     (defun my-add-jslint-declarations ()
       (when (> (buffer-size) 0)
         (let ((btext (replace-regexp-in-string
                       (rx ":" (* " ") "true") " "
                       (replace-regexp-in-string
                        (rx (+ (char "\n\t\r "))) " "
                        ;; only scans first 1000 characters
                        (save-restriction (widen) (buffer-substring-no-properties (point-min) (min (1+ 1000) (point-max)))) t t))))
           (mapc (apply-partially 'add-to-list 'js2-additional-externs)
                 (split-string
                  (if (string-match (rx "/*" (* " ") "global" (* " ") (group (*? nonl)) (* " ") "*/") btext)
                      (match-string-no-properties 1 btext) "")
                  (rx (* " ") "," (* " ")) t))
           )))
     (add-hook 'js2-post-parse-callbacks 'my-add-jslint-declarations)))


;; run web-mode for .js.erb files
(add-to-list 'auto-mode-alist '("\\.js.erb\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; (setq web-mode-content-types-alist
;;   '(("js" . "*\\.js.erb\\'")
;;     ("xml" . "*\\.js.erb\\'")))

(setq typescript-indent-level 2)
