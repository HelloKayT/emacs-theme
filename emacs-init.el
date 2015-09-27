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

(defun katie-monokai-256-color-theme()
  (set-face-foreground 'font-lock-preprocessor-face "#008700")
  (set-face-foreground 'font-lock-builtin-face "#ff5fdf")
  (set-face-foreground 'font-lock-comment-face "#626262")
  (set-face-foreground 'font-lock-constant-face "#4e9a06")
  (set-face-foreground 'font-lock-function-name-face "#5fd700")
  (set-face-foreground 'font-lock-keyword-face "#ff00df")
  (set-face-foreground 'font-lock-string-face "#e6db74")
  (set-face-foreground 'font-lock-type-face "#00afd7")
  (set-face-foreground 'font-lock-variable-name-face "#af87ff")
  (set-face-foreground 'font-lock-warning-face "#cc0000")
  (set-face-foreground 'minibuffer-prompt "#8787ff")
  (set-face-background 'region "#5f0087")
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


;;not sure what colors the background, manually changed background in putty
(defun set-katie-256-window-attributes ()
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
    (set-foreground-color "#1c1c1c")
    (set-background-color "#1c1c1c")
    (set-face-foreground 'default "#c0c0c0")
    (set-face-background 'default "#c0c0c0")
    ;;alternate highlighting color: #75715E
    ;;(set-face-background 'region "#5f005f")
    (set-face-foreground 'region "#5f005f")
    (set-face-foreground 'mode-line "black")
    (set-face-background 'mode-line "lightgrey")
    (set-face-foreground 'menu "black")
    (set-face-background 'menu "lightgrey")
    (set-face-background 'cursor "#afeeee")))



