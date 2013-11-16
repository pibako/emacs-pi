;; OS X custom settings
(when (memq window-system '(mac ns))
  ;; setup exec path
  (exec-path-from-shell-initialize)
  ;; change font
  (add-to-list 'default-frame-alist '(font . "Menlo-11"))
  ;; open file always in the same buffer
  (setq ns-pop-up-frames nil)
  ;; move to trash
  (setq delete-by-moving-to-trash t)
  ;; show full path name in frame bar
  (setq frame-title-format '(:eval
                             (if (buffer-file-name)
                                 (abbreviate-file-name (buffer-file-name))
                               "%b"))))
