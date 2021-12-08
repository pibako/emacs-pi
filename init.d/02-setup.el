;; initial message
(setq initial-scratch-message ";; We hold these truths to be self-evident, that all men are created
;; equal, that they are endowed by their Creator with certain
;; unalienable Rights, that among these are Life, Liberty, and the
;; Pursuit of Happiness. That to secure these rights, Governments are
;; instituted among Men, deriving their just powers from the consent
;; of the governed

")

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

;; set pager to avoid "terminal is not fully functional" message
(setenv "PAGER" "/bin/cat")

;; get rid of this silly toolbar
(tool-bar-mode -1)

(setq column-number-mode t)

;; get rid of splash screen
(setq inhibit-splash-screen t)

;; disable backup and auto-save files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; set initial size of frame
(add-to-list 'default-frame-alist '(height . 66))
(add-to-list 'default-frame-alist '(width . 120))

;; yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

;; change theme to theme-zenburn
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'zenburn t)
;; (load-theme 'wombat t)
;; (load-theme 'adwaita t)
;; (load-theme 'whiteboard t)
;; (load-theme 'leuven t)

;; set fill width
(setq-default fill-column 120)

;; enable smartparens mode
(require 'smartparens-config)
(show-smartparens-global-mode +1)

;;;;;;;;;;;;;;;;;;;; key bindings ;;;;;;;;;;;;;;;;;;;;
;; duplicate line
;; (global-set-key (kbd "C-c C-d") (kbd "C-a C-SPC C-n M-w C-y C-p C-e"))

;; enable 'downcase-region "C-x C-l" and 'upcase-region "C-x C-u"
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; dired human readable
(setq dired-listing-switches "-alh")
;; dired delete by moving to trash
(setq delete-by-moving-to-trash t)

;; smart tab - press once -> indent, press second time -> autocomplete
(setq tab-always-indent 'complete)

;; window move
(windmove-default-keybindings)

;; Stop echoing
(setq comint-process-echoes -1)

;; default indentation width
(setq-default tab-width 2)

;; don't use spaces
(setq-default indent-tabs-mode nil)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; delete the selection with a keypress
(delete-selection-mode t)

;; enable narrow region
(put 'narrow-to-region 'disabled nil)

;; google translate from emacs
(require 'google-translate)
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "pl")
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-at-point-reverse)

;; itail mode
(require 'itail)

;; start emacs server
(server-start)
