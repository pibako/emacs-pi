;; delete whitespace
(add-hook 'before-save-hook
          (lambda
            (let ((dx-java-modes '(java-mode
                                   malabar-mode
                                   malabar-java-mode
                                   conf-javaprop-mode)))
              (if (not (member major-mode dx-java-modes))
                  delete-trailing-whitespace))))

;; and untabify
(add-hook 'before-save-hook
          (lambda
            (let ((tab-sensitive-modes '(makefile-mode
                                         makefile-automake-mode
                                         makefile-gmake-mode
                                         makefile-imake-mode
                                         makefile-makepp-mode
                                         makefile-bsdmake-mode
                                         java-mode
                                         malabar-mode
                                         malabar-java-mode
                                         conf-javaprop-mode)))
              (if (not (member major-mode tab-sensitive-modes))
                  (untabify (point-min) (point-max))))))

;; Add flyspell check in comments
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Enable camel case for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)


(require 'editorconfig)
(editorconfig-mode 1)
