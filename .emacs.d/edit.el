;; Enable smooth scrolling.
;; (setq redisplay-dont-pause t
;;   scroll-margin 1
;;   scroll-step 1
;;   scroll-conservatively 10000
;;   scroll-preserve-screen-position 1)

;; Show line numbers.
(global-linum-mode 1)

;; Auto indentation.
(global-set-key "\C-m" 'newline-and-indent)

;; Tab size is 2.
(setq default-tab-width 2)

;; No tabs (we want spaces instead).
(setq-default indent-tabs-mode nil)

;; No auto-indentation
(setq electric-indent-mode nil)

;; No line wrap.
(setq-default truncate-lines 1)

;; Show matching brackets
(show-paren-mode 1)

;; Remove trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Line numbers to the left
;;(global-linum-mode t)

;; Enable cua-mode by default
;; (cua-mode t)
;; (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;; (transient-mark-mode 1) ;; No region when it is not highlighted
;; (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; Selection should be deleted when typing
(delete-selection-mode 1)

;; Highlight entire bracket content when cursor is inside
;(setq show-paren-style 'expression)

;; All files should be reloaded when the content change on disk.
(global-auto-revert-mode t)

;; Highlight lines with more than 80 chars
(add-hook 'ruby-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-red-b)))

;; No ~ temp files
(setq make-backup-files nil)

;; No #autosave# files
(setq auto-save-default nil)

;; We like brackets auto-paired
(electric-pair-mode 1)

;; Don't use yes or no, we want y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Enable yasnippets globally
(yas-global-mode t)

;; Showing complete file path in title bar
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
