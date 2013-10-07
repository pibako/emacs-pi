(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ;; ("tromey" . "http://tromey.com/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Add geiser, generic emacs-scheme
(add-to-list 'package-archives
             '("geiser" . "http://download.savannah.gnu.org/releases/geiser/packages"))

(package-initialize)

(defvar packages-to-install
  '(auctex
    auto-complete
    coffee-mode
    company
    ctags
    ctags-update
    exec-path-from-shell
    expand-region
    feature-mode
    findr
    flycheck
    gh
    gist
    google-this
    graphviz-dot-mode
    iedit
    inf-ruby
    inflections
    itail
    js-comint
    jump
    logito
    magit
    markdown-mode
    mmm-mode
    pcache
    php-mode
    popup
    rainbow-mode
    rinari
    rsense
    ruby-compilation
    ruby-mode
    scala-mode2
    scss-mode
    textile-mode
    textmate
    w3m
    wrap-region
    yaml-mode
    yari
    yasnippet
    zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(require 'cl)
(defun packages-installed-p ()
  (loop for p in packages-to-install
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun packages-install ()
  (unless (packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p packages-to-install)
      (unless (package-installed-p p)
        (package-install p)))))

(packages-install)
