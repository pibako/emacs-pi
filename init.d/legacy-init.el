;; Magit
(require 'magit)
(define-key global-map (kbd "C-x g") 'magit-status)

;; Yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; D-Mode: Mode for editing DTrace D language.
(autoload 'd-mode "d-mode" () t)
(add-to-list 'auto-mode-alist '("\\.d\\'" . d-mode))

;; When loaded, runs all hooks from d-mode-hook
(add-hook 'd-mode-hook 'imenu-add-menubar-index)
(add-hook 'd-mode-hook 'font-lock-mode)

;; SCSS - do not compile at save
(setq scss-compile-at-save nil)

(require 'cool-mode)
(add-to-list 'auto-mode-alist '("\.cool$" . cool-mode))

;; coffee
(defun coffee-custom ()
  "This is a coffee-mode-hook."
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; delete the selection with a keypress
(delete-selection-mode t)

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

(require 'rcodetools)

(add-to-list 'auto-mode-alist '("\\.st\\'" . smalltalk-mode))

(autoload 'smalltalk-mode "smalltalk-mode.elc" "Smalltalk mode" t)

(autoload 'smalltalk-mode "gst-mode.elc" "GNU Smalltalk mode" t)

;; Enable Flycheck for all files
;; (add-hook 'find-file-hook 'flycheck-mode)
;; Enable Flycheck for all programming modes
;; (add-hook 'prog-mode-hook 'flycheck-mode)
;; Enable Flycheck for all programming modes
(add-hook 'ruby-mode-hook 'flycheck-mode)

(autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

;; cuda
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))

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

(global-hl-line-mode +1)

;; Add flyspell check in comments
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Enable camel case for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)
