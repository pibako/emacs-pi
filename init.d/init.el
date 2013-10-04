;;; init.el --- Summary
;;;
;;; Commentary:
;;; My init script - a bit messy
;;;

;;; Code:

;;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; This from a japanese individual.  I hope it works.
(setq buffer-file-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/")

;; package marmalade

;; get rid of this silly toolbar
(tool-bar-mode -1)

;; get rid of splash screen
(setq inhibit-splash-screen t)

;; set emacs path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; (setenv "PATH"
;;         (shell-command-to-string "echo $PATH"))

;; set emacs exec-path
;; (setq exec-path (append exec-path
;;                         (split-string (getenv "PATH") ":")))

;; set font
;; (set-face-attribute 'default nil :height 110)
(add-to-list 'default-frame-alist '(font . "Menlo-11"))

;; change theme to theme-zenburn
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'zenburn t)
;; (load-theme 'wombat t)
;; (load-theme 'adwaita t)
;; (load-theme 'whiteboard t)
(load-theme 'leuven t)

;; disable backup and auto-save files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; set initial size of frame
(add-to-list 'default-frame-alist '(height . 57))
(add-to-list 'default-frame-alist '(width . 84))

;; yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

;; Enable ctags autoupdate
(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on `ctags-auto-update-mode'." t)
(setq tags-revert-without-query 1)      ; reload tags without yes-no query
(add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
(add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)
(add-hook 'ruby-mode-hook  'turn-on-ctags-auto-update-mode)

;;;;;;;;;;;;;;;;;;;; key bindings ;;;;;;;;;;;;;;;;;;;;
;; duplicate line
;; (global-set-key (kbd "C-c C-d") (kbd "C-a C-SPC C-n M-w C-y C-p C-e"))

;; font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; enable 'downcase-region "C-x C-l" and 'upcase-region "C-x C-u"
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; add markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; add textile-mode
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))
(add-hook 'textile-mode-hook 'ispell-minor-mode)

;; scheme-complete
(autoload 'scheme-smart-complete "scheme-complete" nil t)
(eval-after-load 'scheme
  '(progn (define-key scheme-mode-map "\e\t" 'scheme-smart-complete)))

;; open file always in the same buffer
(setq ns-pop-up-frames nil)

;; Magit
(require 'magit)
(setq magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient") ; Quick fix for emacsclient
(define-key global-map (kbd "C-x g") 'magit-status)

;; move to trash
(setq delete-by-moving-to-trash t)

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

;; install rudel
;; (load-file "~/.emacs.d/vendor/rudel-0.2-4/rudel-loaddefs.el")
;; (load-file "~/Desktop/bzr/rudel/rudel-loaddefs.el")

;; hack
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/adopted/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/infinote/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/jupiter/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/obby/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/socket/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/telepathy/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/tls/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/wave/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/xmpp/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/rudel-0.3/zeroconf/")
;; (let ((default-directory  "~/.emacs.d/elpa/rudel-0.3/"))
;;       (normal-top-level-add-subdirs-to-load-path))

;; Yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; dired human readable
(setq dired-listing-switches "-alh")

;; smart tab - press once -> indent, press second time -> autocomplete
(setq tab-always-indent 'complete)

;; enable paren mode
(show-paren-mode t)

;; python import current path fix
(defun python-reinstate-current-directory ()
  "When running Python, add the current directory ('') to the head of sys.path.
For reasons unexplained, run-python passes arguments to the
interpreter that explicitly remove '' from sys.path. This means
that, for example, using `python-send-buffer' in a buffer
visiting a module's code will fail to find other modules in the
same directory.

Adding this function to `inferior-python-mode-hook' reinstates
the current directory in Python's search path."
  (python-send-string "sys.path[0:0] = ['']"))

(add-hook 'inferior-python-mode-hook 'python-reinstate-current-directory)

;; maxima
;; (push "/Applications/Maxima.app/Contents/Resources/maxima/bin" exec-path)
;; (add-to-list 'load-path "~/.emacs.d/vendor/maxima")
;; (autoload 'maxima-mode "maxima" "Maxima mode" t)
;; (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
;; (autoload 'maxima "maxima" "Maxima interaction" t)
;; (autoload 'imath-mode "imath" "Imath mode for math formula input" t)
;; (setq imaxima-use-maxima-mode-flag t)
(add-to-list 'load-path "~/.emacs.d/vendor/maxima/")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)

;; for Lion users
(setq temporary-file-directory "/tmp")

;; for gnuplot
(push "/Applications/Gnuplot.app/Contents/Resources/bin" exec-path)
;; for Maxima
(push "/Applications/Maxima.app/Contents/Resources/maxima/bin" exec-path)
(push "/Applications/Maxima.app/Contents/Resources/" exec-path)
(setenv "PATH"
        (concat (getenv "PATH")
                ":/Applications/Gnuplot.app/Contents/Resources/bin:/Applications/Maxima.app/Contents/Resources/maxima/bin"))
(setq imaxima-maxima-program "maxima.sh")
;; for imaxima

(push "/Applications/Maxima.app/Contents/Resources/maxima/share/maxima/5.26.0/emacs" load-path)

(autoload 'imaxima "imaxima" "Maxima frontend" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)

;; nice way to have look at your kill ring contents
;; (global-set-key "\C-cy" '(lambda ()
;;         (interactive)
;;         (popup-menu 'yank-menu)))

;; window move
(windmove-default-keybindings)

;; org-mode hooks
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'flyspell-mode)

;; set pager to avoid "terminal is not fully functional" message
(setenv "PAGER" "/bin/cat")

;; Load erc configuration if it is available
(let ((erc-file-path "~/.emacs.d/.ercrc.el.gpg"))
  (if (file-exists-p erc-file-path)
      (load-file erc-file-path)))

;; D-Mode: Mode for editing DTrace D language.
(add-to-list 'load-path "~/.emacs.d/vendor")

(autoload 'd-mode "d-mode" () t)
(add-to-list 'auto-mode-alist '("\\.d\\'" . d-mode))

;; When loaded, runs all hooks from d-mode-hook
(add-hook 'd-mode-hook 'imenu-add-menubar-index)
(add-hook 'd-mode-hook 'font-lock-mode)

;; Stop echoing
(setq comint-process-echoes -1)

;; SCSS - do not compile at save
(setq scss-compile-at-save nil)

(add-to-list 'load-path "~/.emacs.d/vendor/cool-mode")
(require 'cool-mode)
(add-to-list 'auto-mode-alist '("\.cool$" . cool-mode))

;; default indentation width
(setq-default tab-width 2)

;; coffee
(defun coffee-custom ()
  "This is a coffee-mode-hook."
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;; flymake ruby
;; (add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; ruby mode hook
(defun ruby-mode-hook ()
  "This is a ruby-mode-hook."
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("gemspec" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               ;; (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation)
                               (local-set-key (kbd "RET") 'newline-and-indent))))

;; Add key shortcut to yari documentation
(defun ri-bind-key () (local-set-key (kbd "C-c r") 'yari))
(add-hook 'ruby-mode-hook 'ri-bind-key)

;; enable multi major mode
(require 'mmm-auto)

(setq mmm-global-mode 'auto)

(mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)
(mmm-add-mode-ext-class 'html-erb-mode "\\.html\\.erb\\'" 'erb)
(mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
(mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.eco\\'" 'erb)

(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . html-erb-mode))
(add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode))
(add-to-list 'auto-mode-alist '("\\.jst\\.eco\\'"  . html-erb-mode))

;; Optional settings:

(setq mmm-parse-when-idle t)

;; (setq mmm-submode-decoration-level 2
;;       mmm-parse-when-idle t)

;; ;; ruby-dev (ala SLIME)
;; (add-to-list 'load-path "~/.emacs.d/vendor/ruby-dev.el" )
;; (autoload 'turn-on-ruby-dev "ruby-dev" nil t)
;; (add-hook 'ruby-mode-hook 'turn-on-ruby-dev)

(ruby-mode-hook)

;; enable rinari globaly (previously this option was on by default?)
(global-rinari-mode)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; pending delete mode
;; (pending-delete-mode t)

;; electric-pair-mode
;; (electric-pair-mode t)

;; don't use spaces
(setq-default indent-tabs-mode nil)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; Rsense
(setq rsense-home "/Users/pi/.emacs.d/vendor/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; Rsense + Autocomplete
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; swap-buffers-in-windows
(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window, and vice versa."
  (interactive)
  (let* ((this (selected-window))
         (other (next-window))
         (this-buffer (window-buffer this))
         (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)))

;; initial message
(setq initial-scratch-message ";; We hold these truths to be self-evident, that all men are created
;; equal, that they are endowed by their Creator with certain
;; unalienable Rights, that among these are Life, Liberty, and the
;; Pursuit of Happiness. That to secure these rights, Governments are
;; instituted among Men, deriving their just powers from the consent
;; of the governed

")

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

;; ispell and flyspell for message
(add-hook 'message-send-hook 'ispell-message)

(defun my-message-setup-routine ()
  (flyspell-mode 1))
(add-hook 'message-setup-hook 'my-message-setup-routine)

;; delete the selection with a keypress
(delete-selection-mode t)

(defun open-with ()
  "Simple function that allows us to open the underlying
file of a buffer in an external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))

(require 'external-abook)
(setq external-abook-command "contacts -lSf '%%e\t\"%%n\"' '%s'")
;; (setq external-abook-command "contacts -lf '%%e\t%%n' %s")
(eval-after-load "message"
  '(progn
     (add-to-list 'message-mode-hook
                  '(lambda ()
                     (define-key message-mode-map "\C-c\t" 'external-abook-try-expand)))))

;; scala mode
;; (require 'scala-mode-auto)

;; load the ensime lisp code...
(add-to-list 'load-path "~/.emacs.d/vendor/ensime/elisp/")
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; show full path name in frame bar
(setq frame-title-format '(:eval (if (buffer-file-name) (abbreviate-file-name (buffer-file-name)) "%b")))

;; start emacs server
(server-start)

;; gnus imap search
(require 'nnir)

;; start gnus
;; (gnus)

;; enable narrow region
(put 'narrow-to-region 'disabled nil)

;; enable textmate-mode
(textmate-mode)

;; YASnippet
(yas-global-mode 1)

;; wrap-mode
(wrap-region-global-mode t)
(add-to-list 'wrap-region-tag-active-modes 'html-erb-mode)

;; css-mode set indentation to 2
(setq css-indent-offset 2)

;; js-mode set indentation to 2
(setq js-indent-level 2)

(setq inferior-js-program-command "/usr/local/bin/rhino")

;; delete whitespace and untabify
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun untabify-hook ()
  (untabify (point-min) (point-max)))

(add-hook 'before-save-hook 'untabify-hook)

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

(add-to-list 'load-path "~/.emacs.d/vendor/rcodetools")
(require 'rcodetools)

(setq auto-mode-alist
      (append  '(("\\.st\\'" . smalltalk-mode))
               auto-mode-alist))

(add-to-list 'load-path "/usr/local/Cellar/gnu-smalltalk/3.2.4/share/emacs/site-lisp/")

(autoload 'smalltalk-mode "smalltalk-mode.elc" "Smalltalk mode" t)

(autoload 'smalltalk-mode "gst-mode.elc" "GNU Smalltalk mode" t)

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region.  You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

;; Enable Flycheck for all files
;; (add-hook 'find-file-hook 'flycheck-mode)
;; Enable Flycheck for all programming modes
;; (add-hook 'prog-mode-hook 'flycheck-mode)
;; Enable Flycheck for all programming modes
(add-hook 'ruby-mode-hook 'flycheck-mode)


(add-to-list 'load-path "~/.emacs.d/vendor/actionscript")
(autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))


(defun create-scratch-buffer nil
  "Create a scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (insert initial-scratch-message))

;; cuda
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq google-translate-enable-ido-completion t)
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "pl")
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-at-point-reverse)

;; itail mode
(require 'itail)

;; edit with emacs - only chrome?
(require 'edit-server)
(edit-server-start)

;;
;; new editing stuff
;;
(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(global-set-key [(shift return)] 'smart-open-line)

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-hl-line-mode +1)

;; FIX ME:
;; (defadvice ido-find-file (after find-file-sudo activate)
;;   "Find file as root if necessary."
;;   (unless (and buffer-file-name
;;                (file-writable-p buffer-file-name))
;;     (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(global-set-key (kbd "C-c D")  'delete-file-and-buffer)

;; Add flyspell check in comments
(add-hook 'prog-mode-hook 'flyspell-prog-mode)


;; Enable camel case for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)

;; Some improvements to inf-ruby mode with company-mode
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))

;; Add floobits support (load "~/.emacs.d/floobits/floobits.el")
(load "~/.emacs.d/vendor/floobits/floobits.el")

(load "~/.emacs.d/vendor/rdoc-mode/rdoc-mode.el")