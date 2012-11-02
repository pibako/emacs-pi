;;;;;;;;;;;;;;;;;;;;
;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; This from a japanese individual.  I hope it works.
(setq default-buffer-file-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/")

;; package marmalade 
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ;; ("tromey" . "http://tromey.com/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

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
(load-theme 'zenburn t)
;; (load-theme 'wombat t)
;; (load-theme 'whiteboard t)

;; disable backup and auto-save files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; set initial size of frame
(add-to-list 'default-frame-alist '(height . 57))
(add-to-list 'default-frame-alist '(width . 84))

;; ido-mode
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window)

;; auto-completion in minibuffer
(icomplete-mode +1)

;; yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

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
(define-key global-map (kbd "C-x g") 'magit-status)

;; move to trash
(setq delete-by-moving-to-trash t)

;; use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

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

(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
	  (ido-enable-flex-matching
	   (if (boundp 'ido-enable-flex-matching)
	       ido-enable-flex-matching t))
	  name-and-pos symbol-names position)
      (unless ido-mode
	(ido-mode 1)
	(setq ido-enable-flex-matching t))
      (while (progn
	       (imenu--cleanup)
	       (setq imenu--index-alist nil)
	       (ido-goto-symbol (imenu--make-index-alist))
	       (setq selected-symbol
		     (ido-completing-read "Symbol? " symbol-names))
	       (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
	(push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
	(goto-char (overlay-start position)))
       (t
	(goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
	(cond
	 ((and (listp symbol) (imenu--subalist-p symbol))
	  (ido-goto-symbol symbol))
	 ((listp symbol)
	  (setq name (car symbol))
	  (setq position (cdr symbol)))
	 ((stringp symbol)
	  (setq name symbol)
	  (setq position
		(get-text-property 1 'org-imenu-marker symbol))))
	(unless (or (null position) (null name)
		    (string= (car imenu--rescan-item) name))
	  (add-to-list 'symbol-names name)
	  (add-to-list 'name-and-pos (cons name position))))))))
;; (global-set-key "\M-i" 'ido-goto-symbol) ; or any key you see fit
(global-set-key "\C-ci" 'ido-goto-symbol) ; or any key you see fit


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
;; 			   (interactive)
;; 			   (popup-menu 'yank-menu)))

;; window move
(windmove-default-keybindings)

;; org-mode hooks
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'flyspell-mode)

;; set pager to avoid "terminal is not fully functional" message
(setenv "PAGER" "/bin/cat")

(load-file "~/.emacs.d/.ercrc.el.gpg")

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
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; flymake ruby
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; ruby mode hook
(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation))))

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

;; (setq mmm-submode-decoration-level 2
;;       mmm-parse-when-idle t)

;; ;; ruby-dev (ala SLIME)
;; (add-to-list 'load-path "~/.emacs.d/vendor/ruby-dev.el" )
;; (autoload 'turn-on-ruby-dev "ruby-dev" nil t)
;; (add-hook 'ruby-mode-hook 'turn-on-ruby-dev)

(ruby-mode-hook)

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
  "Put the buffer from the selected window in next window, and vice versa"
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

(defun skim-make-url () (concat
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
(require 'scala-mode-auto)

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
(gnus)

;; enable narrow region
(put 'narrow-to-region 'disabled nil)

;; enable textmate-mode
(textmate-mode)

;; YASnippet
(yas-global-mode 1)

;; wrap-mode
(wrap-region-global-mode t)
(add-to-list 'wrap-region-tag-active-modes 'HTML)
(add-to-list 'wrap-region-tag-active-modes 'ERB-HTML)
(add-to-list 'wrap-region-tag-active-modes 'MMM)
