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
  (add-to-list 'auto-mode-alist '("\\.xml.builder\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.json.jbuilder\\'" . ruby-mode))
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

;; Enable Flycheck for all files
;; (add-hook 'find-file-hook 'flycheck-mode)
;; Enable Flycheck for all programming modes
;; (add-hook 'prog-mode-hook 'flycheck-mode)
;; Enable Flycheck for all programming modes
(add-hook 'ruby-mode-hook 'flycheck-mode)

;; wrap-mode
(wrap-region-global-mode t)
(add-to-list 'wrap-region-tag-active-modes 'html-erb-mode)

;; rcodetools provides xmpfilter for in buffer evaluation
(require 'rcodetools)

;; Enable robe (for Ruby)
(add-hook 'ruby-mode-hook 'robe-mode)
(setq robe-turn-on-eldoc nil)

;; use bundle exec with the cucumber
(setq feature-cucumber-command "bundle exec cucumber CUCUMBER_OPTS=\"{options}\" \"{feature}\"")
