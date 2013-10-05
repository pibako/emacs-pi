;; maxima
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)

;; for Lion users
(setq temporary-file-directory "/tmp")

;; for gnuplot
(push "/Applications/Gnuplot.app/Contents/Resources/bin" exec-path)
;; for Maxima
(push "/Applications/Maxima.app/Contents/Resources/maxima/bin" exec-path)
(push "/Applications/Maxima.app/Contents/Resources/" exec-path)
(setenv "PATH"
        (concat (getenv "PATH")
                ":/Applications/Gnuplot.app/Contents/Resources/bin:/Applications/Maxima.app/Contents/Resources/maxima/bin"))
(setq imaxima-maxima-program "maxima.sh")
;; for imaxima

(autoload 'imaxima "imaxima" "Maxima frontend" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)
