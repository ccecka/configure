(eval-when-compile
  (require 'color-theme))

(defun cecka-theme ()
  (interactive)
  (color-theme-install
   '(cecka-theme
      ((background-color . "#000000")
      (background-mode . light)
      (border-color . "#000000")
      (cursor-color . "#d17471")
      (foreground-color . "#ffffff")
      (mouse-color . "black"))
     (fringe ((t (:background "#000000"))))
     (mode-line ((t (:foreground "#bababa" :background "#303030"))))
     (region ((t (:background "#003e8f"))))
     (font-lock-builtin-face ((t (:foreground "#a1a1a1"))))
     (font-lock-comment-face ((t (:foreground "#fa7d00"))))
     (font-lock-function-name-face ((t (:foreground "#8ac2ff"))))
     (font-lock-keyword-face ((t (:foreground "#5deafe"))))
     (font-lock-string-face ((t (:foreground "#e5af52"))))
     (font-lock-type-face ((t (:foreground"#78ce5f"))))
     (font-lock-constant-face ((t (:foreground "#70ffa9"))))
     (font-lock-variable-name-face ((t (:foreground "#ffe5a3"))))
     (minibuffer-prompt ((t (:foreground "#ffffff" :bold t))))
     (font-lock-warning-face ((t (:foreground "red" :bold t))))
     )))

