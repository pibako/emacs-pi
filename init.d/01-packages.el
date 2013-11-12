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
    clojure-mode
    coffee-mode
    company
    company-inf-ruby
    ctags
    ctags-update
    dash
    exec-path-from-shell
    expand-region
    f
    feature-mode
    findr
    flycheck
    gh
    gist
    git-commit-mode
    git-rebase-mode
    google-this
    google-translate
    graphviz-dot-mode
    ido-vertical-mode
    haml-mode
    haskell-mode
    htmlize
    iedit
    inf-ruby
    inflections
    itail
    js-comint
    js2-mode
    js2-refactor
    jump
    logito
    magit
    markdown-mode
    mmm-mode
    multiple-cursors
    nodejs-repl
    nrepl
    org
    osx-plist
    ox-reveal
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
    robe
    rspec-mode
    ruby-block
    ruby-compilation
    ruby-end
    ruby-mode
    s
    scala-mode2
    scheme-complete
    scss-mode
    smartparens
    smex
    sublimity
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
