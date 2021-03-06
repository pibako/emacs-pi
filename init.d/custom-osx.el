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
                               "%b")))
  ;; global line highlighting in all buffers
  (global-hl-line-mode +1)
  ;; Start edit server
  (when (require 'edit-server nil t)
    (setq edit-server-new-frame nil)
    (edit-server-start))

  (defun open-in-intellij ()
    "Open file in intelliJ"
    (interactive)
    (when buffer-file-name
      (shell-command
       (concat "\"/Applications/IntelliJ IDEA CE.app/Contents/MacOS/idea\""
               projectile-project-root
               " --line "
               (number-to-string (line-number-at-pos))
               " "
               buffer-file-name
               " &"))))
  (global-set-key (kbd "C-c i") 'open-in-intellij))
