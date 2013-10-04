;; seeing is believing ;-D
(defun seeing-is-believing ()
  "Replace the current region (or the whole buffer, if none) with
the output of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region beg end "seeing_is_believing" nil 'replace)))

(defun seeing-is-believing-debug ()
  "Replace the current region (or the whole buffer, if none) with
the output of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region beg end "seeing_is_believing --debug" nil 'replace)))

(defun seeing-is-believing-cleanup ()
  "Remove comments from the current region (or the whole buffer,
if none)."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (replace-regexp "#[^{].*" "" nil beg end)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "M-s M-s") 'seeing-is-believing)
            (local-set-key (kbd "M-s M-c") 'seeing-is-believing-cleanup)))
