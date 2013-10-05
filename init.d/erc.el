;; Load erc configuration if it is available
(let ((erc-file-path "~/.emacs.d/.ercrc.el.gpg"))
  (if (file-exists-p erc-file-path)
      (load-file erc-file-path)))
