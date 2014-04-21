(custom-set-variables
 ;; Cursor blinking
 '(blink-cursor-mode nil)

 ;; Display the column and line number at the bottom
 '(column-number-mode t)
 '(line-number-mode t)
 '(global-linum-mode 1)

 ;; Standard bindings for copy-paste-highlighting
 '(cua-mode t)

 ;; Turn off toolbar, set small fringe, scrollbar on the right
 '(tool-bar-mode nil)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(scroll-bar-mode (quote right))

 ;; Kill newbie messages
 '(inhibit-startup-message t)
 '(inhibit-startup-screen t)
 '(inhibit-startup-echo-area-message t)

 ;; Paren matching and highlighting
 '(show-paren-mode t)
 '(show-paren-style 'parenthesis)

 ;; Font locking and transient marking
 '(transient-mark-mode t)
 ;; Automatically highlight when possible
 '(global-font-lock-mode t t)

 ;; Highlight during query
 '(query-replace-highlight t)
 ;; Highlight incremental search
 '(search-highlight t)

 ;; Make C-k delete the trailing newline as well
 '(kill-whole-line t)
 ;; End files in newlines
 '(require-final-newline t)

 ;; 2 space tabs, 1 scroll step
 '(tab-width 2)
 '(python-indent 2)
 '(scroll-step 1)

 ;; Stop creating backup~ and #autosave# files
 '(make-backup-files nil)
 '(auto-save-default nil)
)

;; See if we're on Apple, Windows, Linux
(defvar system-type-as-string (prin1-to-string system-type))
(defvar mswindows-p (string-match "windows-nt" system-type-as-string))
(defvar macosx-p    (string-match "darwin"     system-type-as-string))
(defvar linux-p     (string-match "linux"      system-type-as-string))

;; Default frame height and width
(cond (macosx-p (setq default-frame-alist
											'((font . "-apple-liberation mono-medium-r-normal--11-110-72-72-m-110-iso10646-1")
												(width . 85)
												(height . 70)))))

(cond (linux-p (setq default-frame-alist
										 '((font . "Liberation Mono-10")
											 (width . 85)
											 (height . 100)))))

;; Path to look for extra files
(add-to-list 'load-path "~/.emacs.d")

;; Turn on my color theme
;; Generated with http://jasonm23.github.com/emacs-theme-editor/
(load-file "~/.emacs.d/themes/cecka-theme.el")
(cecka-theme)

;; Set the mac keyboard up for sane emacs usage
(setq mac-command-modifier 'ctrl)
(setq mac-option-modifier 'meta)

;; alias "y" and "n" for commands that want "yes" or "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Auto update the buffer if file changes on disk
(global-auto-revert-mode t)

;; Load Google C/C++ style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Load guess-style to detect tab size, etc
(require 'guess-style)
(autoload 'guess-style-set-variable "guess-style" nil t)
(autoload 'guess-style-guess-variable "guess-style")
(autoload 'guess-style-guess-all "guess-style" nil t)

;; Load smart-tabs-mode
(require 'smart-tabs-mode)
(smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python 'ruby 'nxml)

;; C/C++ style
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'guess-style-guess-all)
(add-hook 'c-mode-common-hook 'smart-tabs-mode-enable)
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)

;; Python smart-tabs
(add-hook 'python-mode-hook 'guess-style-guess-all)
(add-hook 'python-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice python-indent-line-1 python-indent)

;; Remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;________________________________________________________________
;;    File extensions
;;________________________________________________________________

;; Makefiles
(add-to-list 'auto-mode-alist '("GNU[Mm]akefile" . makefile-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile" . makefile-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile.inc" . makefile-mode))

;; Treat .h and .cu files like C++
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.kern$" . c++-mode))

;;________________________________________________________________
;;    Key binding
;;________________________________________________________________

;; We set a key-binding for this often-used command:
(global-set-key "\M-C" 'compile)
;; Notice that by default 'compile calls "make -k"

;; The following two commands load the source file automatically and point
;; to the error/warning line. This make emacs essentially a (mouse-free) IDE:
(global-set-key [f11] 'previous-error)
(global-set-key [f12] 'next-error)

;; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)
(global-set-key [f1] 'goto-line)
(global-set-key [f2] 'what-line)

(global-set-key [S-f3] 'ptreg1)
(global-set-key [f3] 'gtreg1)
(global-set-key [S-f4] 'ptreg2)
(global-set-key [f4] 'gtreg2)
(global-set-key [S-f5] 'ptreg3)
(global-set-key [f5] 'gtreg3)
(global-set-key [S-f6] 'ptreg4)
(global-set-key [f6] 'gtreg4)

(global-set-key [f7] 'altotop)
(global-set-key [S-f7] 'eval-region)

;; (global-set-key [f8] 'funcsumm)
(global-set-key [f8] 'bury-buffer)
(global-set-key [S-f8] 'unbury-buffer)

;; (global-set-key [S-f8] 'brf-FindNextDbl)

;; We also set [M-f8] below to hs-toggle-hiding

(global-set-key [M-f9] 'shrink-window)
(global-set-key [M-f10] 'enlarge-window)

;; (global-set-key [f9] 'delete-other-windows) ; ^x 1
;; (global-set-key [f10] 'other-window)	; ^x o

;; windows doesn't send S-f3 but f13 so we define those:
(global-set-key [f13] 'ptreg1)
(global-set-key [f14] 'ptreg2)
(global-set-key [f15] 'ptreg3)
(global-set-key [f16] 'ptreg4) ;; interesting; by default it maps to <print>.
(global-set-key [f17] 'eval-region)


;; Auto start speedbar
(speedbar 1)
(add-to-list 'speedbar-frame-parameters '(left-fringe . 0) '(right-fringe . 0))
(set-face-attribute 'speedbar-button-face nil :height 100)
(speedbar-add-supported-extension ".cu")
(speedbar-add-supported-extension ".kern")
(speedbar-add-supported-extension ".inc")
;;(other-frame 0)
