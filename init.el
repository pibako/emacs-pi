;;; init.el --- Summary
;;;
;;; Commentary:
;;; Piotr Kowalski's Emacs 24 Configuration < Avdi Grim's Emacs 24 Configuration
;;;

;;; Code:

;; Directories and file names

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq pi-emacs-init-file (or load-file-name buffer-file-name))
(setq pi-emacs-config-dir
      (file-name-directory pi-emacs-init-file))
(setq pi-init-dir
      (expand-file-name "init.d" pi-emacs-config-dir))

;; Load all elisp files in ./init.d
(if (file-exists-p pi-init-dir)
    (dolist (file (directory-files pi-init-dir t "\\.el$"))
      (load file)))

;; Set up 'custom' system
(setq custom-file (expand-file-name "emacs-customizations.el" pi-emacs-config-dir))
(load custom-file)
