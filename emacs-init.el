;;; Bag the eye candy
(if window-system
    (progn
      (scroll-bar-mode 0)
      (tool-bar-mode 0))
  (menu-bar-mode 0))

;;
;; Fonts and colors
;;
(global-font-lock-mode t)
;;; Colorized fonts
(setq font-lock-maximum-decoration t)

(defun katie-monokai-color-theme()
  (set-face-foreground 'font-lock-builtin-face "#4e9a06")
  (set-face-foreground 'font-lock-comment-face "#8d9393")
  (set-face-foreground 'font-lock-constant-face "#4e9a06")
  (set-face-foreground 'font-lock-function-name-face "#A6E22E")
  (set-face-foreground 'font-lock-keyword-face "#F92672")
  (set-face-foreground 'font-lock-string-face "#e6db74")
  (set-face-foreground 'font-lock-type-face "#66D9EF")
  (set-face-foreground 'font-lock-variable-name-face "#dda0dd")
  (set-face-foreground 'font-lock-warning-face "#cc0000")
)

(add-hook 'font-lock-mode-hook 'katie-monokai-color-theme)

(defun set-katie-window-attributes ()
  (when window-system
    (set-frame-position (selected-frame) 0 0)
    (cond ((= (display-pixel-height) 1080)
           (set-frame-height (selected-frame) 66)
           (set-frame-width (selected-frame) 112)
           (set-frame-font "9x15bold"))
          (t
           (set-frame-height (selected-frame) 48)
           (set-frame-width (selected-frame) 112)
           (set-frame-font "9x15bold")))
    (set-face-foreground 'default "#F8F8F2")
    (set-face-background 'default "#272822")
    ;;alternate highlighting color: #75715E
    (set-face-background 'region "dark violet")
    (set-face-foreground 'mode-line "black")
    (set-face-background 'mode-line "lightgrey")
    (set-face-foreground 'menu "black")
    (set-face-background 'menu "lightgrey")
    (set-face-background 'cursor "#afeeee")))


(set-katie-window-attributes)



