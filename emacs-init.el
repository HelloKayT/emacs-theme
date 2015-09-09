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

(defun font-lock-mode-setup ()
  (set-face-foreground 'font-lock-builtin-face "medium orchid")
  (set-face-foreground 'font-lock-comment-face "wheat")
  (set-face-foreground 'font-lock-constant-face "orange")
  (set-face-foreground 'font-lock-function-name-face "gold")
  (set-face-foreground 'font-lock-keyword-face "orange")
  (set-face-foreground 'font-lock-string-face "wheat")
  (set-face-foreground 'font-lock-type-face "orange")
  (set-face-foreground 'font-lock-variable-name-face "gold")
  (set-face-foreground 'font-lock-warning-face "red")
  )

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

;;; modify-frame-parameters speeds up set-default-font
;;; (modify-frame-parameters nil '((wait-for-wm . nil)))

;; other frame-fonts to try:
;; "9x15", "9x15bold", "lucidasanstypewriter-12","lucidasanstypewriter-bold-16"
;; (set-frame-font "-apple-Menlo-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
;; (set-frame-font "-*-Menlo-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")

(defun set-default-window-attributes ()
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
    ; (set-frame-font "lucidasanstypewriter-bold-14")
    (set-face-foreground 'default "mediumspringgreen")
    ; (set-face-foreground 'default  "lightgrey")
    (set-face-background 'default "black")
    (set-face-foreground 'highlight "blue")
    (set-face-foreground 'mode-line "black")
    (set-face-background 'mode-line "lightgrey")
    (set-face-foreground 'menu "black")
    (set-face-background 'menu "lightgrey")
    (set-cursor-color "cyan")))

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

;; don't split window horizontally
(setq split-width-threshold nil)

;; always end a file with a newline
(setq require-final-newline t)
;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)
(setq inhibit-startup-message t)
(setq delete-old-versions t)
(setq trim-versions-without-asking t)
(setq version-control t) ; Allow numbered backups
;(cond ((file-exists-p "~/.backups")
;       (setq auto-save-list-file-prefix "~/.backups/.saves-")))
(setq enable-local-variables nil)
(setq tab-width 3)
(setq tab-interval 3)
(setq make-backup-files t)
(setq next-line-add-newlines nil)
;;; Set up fill mode in a few places.
(setq set-fill-column 80)
(add-hook 'text-mode-hook		; do auto fill mode in text mode
          '(lambda () (auto-fill-mode 1)))
(setq visible-bell t)
(setq-default indent-tabs-mode nil)
;(modify-syntax-entry "_" "w")
(let ((process-connection-type nil))	; try not to hog a pty for this.
  (display-time))
(setq frame-title-format "Emacs - %f")
(setq icon-title-format "Emacs - %b")
(line-number-mode t)

;; enable visual feedback on selections
(setq-default transient-mark-mode t)
(transient-mark-mode t)
(setq suggest-key-bindings nil)
(setq query-replace-highlight t)	;highlight during query
(setq search-highlight t)		;incremental search highlights
(put 'eval-expression 'disabled nil)
(require 'paren)                        ; Show matching parens

;; Turn on interactive completion (Emacs 24.4+)
;(if (and (= emacs-major-version 24)
;         (>= emacs-minor-version 4))
;    (icomplete-mode))
;

;;;
;;; Key bindings, file mode, and generic code editing customizations
;;;

;; Key bindings and keyboard macros
(define-key esc-map "\^i" 'smart-indent)
(define-key esc-map "\^j" 'smart-indent)
(define-key esc-map "\^m" 'bottom-to-center)
(define-key esc-map "\^r" 'revert-buffer)
(define-key esc-map "\^v" 'point-to-top)
(define-key esc-map "\ " 'pop-mark-ring)
(define-key esc-map "\m" 'auto-fill-mode)
(define-key esc-map "\g" 'goto-line)
(define-key esc-map "\^x" 'eval-defun)
(define-key esc-map "\^l" 'goto-buffer)
(define-key esc-map "\^@" 'exchange-point-and-mark)
(define-key esc-map [?\C-\ ] 'exchange-point-and-mark)
(define-key esc-map " "   'pop-mark-ring)
(define-key esc-map "\^o" 'other-window)
(define-key esc-map "\^y" 'repeat-complex-command)
(define-key esc-map "\_" 'undo)

(define-key global-map "\^@" 'set-mark-command)
(define-key global-map "\g"  'goto-line)
(define-key global-map "\" 'find-file-other-window)
(define-key global-map "\" 'compile)
(define-key global-map "\" 'next-error)
(define-key global-map "\^X;" 'comment-uncomment-region)
(define-key global-map "\C-c\C-w" 'compare-windows)
(define-key global-map "\C-c\C-v" 'scroll-other-window)

(define-key global-map [?\C-<] 'beginning-of-buffer)
(define-key global-map [?\C->] 'end-of-buffer)
(define-key global-map [?\s-<] 'beginning-of-buffer)
(define-key global-map [?\s->] 'end-of-buffer)
(define-key global-map [?\s-d] 'kill-word)
(define-key global-map [?\s-f] 'forward-word)
(define-key global-map [?\s-v] 'scroll-down-command)
(define-key global-map [?\s-w] 'kill-ring-save)

(define-key ctl-x-4-map "r" 'revert-buffer-noconfirm)
(define-key ctl-x-4-map "k" 'kill-rectangle)
(define-key ctl-x-4-map "v" 'vc-next-action)
(define-key ctl-x-4-map "y" 'yank-rectangle)
(define-key ctl-x-4-map ";" 'set-comment-column)

(defun pop-mark-ring ()
  (interactive)
  (set-mark-command 1))

(defun goto-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun revert-buffer-noconfirm ()
  (interactive)
  (revert-buffer () t))

(defun bottom-to-center ()
  (interactive)
  (scroll-up)(recenter))

(defun point-to-top ()
  (interactive)
  (recenter 0))

;fix for "^M"s in *shell*
;(setq explicit-shell-file-name "/bin/bash")

(defvar find-file-not-found-error 'ask
  "t says don't create a new buffer if file not found.
Non-nil but not t says ask user whether to create a new buffer in such a case
nil means create new buffer.")

(defun comment-uncomment-region (arg)
  (interactive "P")
  (barf-if-buffer-read-only)
  (if (null arg)
      (if (string-equal comment-start "/* ")
	  (my-comment-c-region)
	(my-comment-region comment-start))
    (my-uncomment-region comment-start)))

(defun my-comment-region (comment-char)
  (save-excursion
    (let ((count (count-lines (point) (mark))))
      (if (> (point) (mark))(exchange-point-and-mark))
      (while (> count 0)
	(beginning-of-line)
	(insert (or comment-char "#"))
	(forward-line)
	(setq count (1- count))))))

(defun my-comment-c-region ()
  (interactive)
  (save-excursion
    (let ((count (count-lines (point) (mark))))
      (if (> (point) (mark))(exchange-point-and-mark))
      (forward-line -1)
      (end-of-line)
      (newline)
      (insert "/* ")
      (forward-line)
      (while (> count 0)
	(beginning-of-line)
	(insert " * ")
	(forward-line)
	(setq count (1- count)))
      (newline)(forward-line -1)
      (insert " */ "))))

(defun box-c-region ()
  (interactive)
  (save-excursion
    (let ((count (count-lines (point) (mark))))
      (if (> (point) (mark))(exchange-point-and-mark))
      (forward-line -1)
      (end-of-line)
      (newline)
      (insert "/******************************** ")
      (forward-line)
      (while (> count 0)
	(beginning-of-line)
	(insert " * ")
	(forward-line)
	(setq count (1- count)))
      (newline)(forward-line -1)
      (insert " ********************************/ "))))

(defun my-uncomment-region (comment-char)
  (save-excursion
    (let ((count (count-lines (point) (mark))))
      (if (> (point)(mark))(exchange-point-and-mark))
      (while (> count 0)
	(beginning-of-line)
	(if (string-equal
	     (buffer-substring (point)(min (point-max)(1+ (point))))
	     comment-char)
	    (delete-char 1))
	(forward-line)
	(setq count (1- count))))))


;;; c-m-i will line up to next word on previous line.

(defun smart-indent ()
  (interactive)
  (let ((tab (indent-spaces 5)))
    (if tab (indent-to tab))))

(defun indent-spaces (lines)
  (let (tab
	(up 1))
    (forward-to-non-whitespace)
    (while (and (< up lines)(not tab))
      (setq tab (find-indent up))
      (setq up (+ up 1)))
    tab))

(defun forward-to-non-whitespace ()
    ;; move to first non-whitespace char, on current line,
    ;; if there is one.
  (let ((current-point (point))
	(eol-point (save-excursion
		     (end-of-line)
		     (point))))
    (condition-case ()
	(progn
	  (re-search-forward "[^ \n\t]")
	  (backward-char 1))
      (error nil))
    (if (> (point) eol-point)(goto-char current-point))))

(defun find-indent (up)
  (save-excursion
    (previous-line up)
    (let ((point (point))
	  nchars
	  (col 	 (current-column)))
      (if (not (looking-at "[\t\n ]"))
	  (re-search-forward " "))
      (re-search-forward "[^ \n\t]")
      (backward-char 1)
      (setq nchars (- (current-column) col))
      (beginning-of-line)
      (if (<= (point) point)
	  (+ col nchars)
	nil))))
