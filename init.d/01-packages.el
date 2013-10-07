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
    bundler
    coffee-mode
    company-inf-ruby
    company
    ctags
    ctags-update
    exec-path-from-shell
    expand-region
    feature-mode
    flycheck
    f
    gist
    gh
    google-this
    google-translate
    graphviz-dot-mode
    haml-mode
    haskell-mode
    iedit
    itail
    js-comint
    js2-refactor
    js2-mode
    logito
    magit
    git-rebase-mode
    git-commit-mode
    markdown-mode
    mmm-mode
    multiple-cursors
    nodejs-repl
    nrepl
    clojure-mode
    org
    osx-plist
    pcache
    php-mode
    pkg-info
    pony-mode
    popup
    pov-mode
    rainbow-mode
    rbenv
    request
    rinari
    jump
    inflections
    findr
    rsense
    rspec-mode
    ruby-block
    ruby-compilation
    ruby-mode
    inf-ruby
    ruby-end
    s
    scala-mode2
    scheme-complete
    scss-mode
    sublimity
    textile-mode
    textmate
    w3m
    wrap-region
    dash
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
