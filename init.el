;; Emacs Config 2020.1
;;

;; Needed by Package.el.
(package-initialize)

;; Thanks to http://blog.binchen.org/posts/easy-indentation-setup-in-emacs-for-web-development.html
(defun pd/setup-indent-level (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun pd/open-today-todo-file ()
  "Open current todo file"
  (interactive)
  (find-file (concat  (getenv "TODO") "/" (format-time-string "%Y%m%d.org")))
  (org-mode))

(defvar my-packages '(
		      magit
		      swiper
		      swiper-helm
		      helm
		      helm-rg
		      iedit
		      dumb-jump
		      docker
		      elfeed
		      elfeed-goodies
		      humanoid-themes
		      fzf
		      helm-ag
		      ))

;; Install packages - this is in its own function to control
;; Internet / Proxy access.
(defun pd/install-packages ()
  "Installs the packages defined in my-packages"
  (interactive)
  (dolist (p my-packages)
    (unless (package-installed-p p)
      (package-refresh-contents)
      (package-install p))
    (add-to-list 'package-selected-packages p)))

;; Melpa
(require 'package)
(setq package-archives '(
			 ("gnu" . "https://elpa.gnu.org/packages/")
                         ;;("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ))

;; Helm config
(require 'helm-config)

(setq helm-split-window-in-side-p           t 
      helm-move-to-line-cycle-in-source     t 
      helm-ff-search-library-in-sexp        t 
      helm-scroll-amount                    8 
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line        t)

(helm-mode 1)

;; ido-mode (mostly for default find file functionality)
(ido-mode 1)

;; Toolbar off
(tool-bar-mode -1)

;; Menu bar off
(menu-bar-mode -1)

;; Save custom changes to another file - these will be
;; loaded later
(setq custom-file "~/.emacs.d/custom.el")

;; Only visible bell
(setq visible-bell t)

;; Customize backup file creation
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Font
;;(set-frame-font "Courier 15" nil t)
(set-frame-font "Source Code Pro 14" nil t)

;; No backup files
(setq make-backup-files nil)

;; Confirm before closing emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Sentences have one space after the period
(setq sentence-end-double-space nil)

;; Line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Symlinks
(setq vc-follow-symlinks nil)

;; Show current line
;;(global-hl-line-mode 1)

;; Human readable units in dired
(setq-default dired-listing-switches "-alh")

;; Make recursive copies default in dired
(setq dired-recursive-copies 'always)

;; Ask for y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Set shell variables
;;(when (memq window-system '(mac ns x))
;;  (exec-path-from-shell-initialize))

;; No scroll bars
(scroll-bar-mode -1)

;; Encrypt gpg files automatically
(require 'epa-file)
(epa-file-enable)

;; Set initial window size
(setq initial-frame-alist '((top . 90) (left . 490) (width . 190) (height . 70)))

;; Show full file path in title bar
(setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b"))))

;; Display current time
(display-time-mode t)

;; Overwrite marked text
(delete-selection-mode 1)

;; Setup elfeed
(setq FEEDS_FILE "~/feeds.el")
(when (file-exists-p FEEDS_FILE)
  (load FEEDS_FILE))
(elfeed-goodies/setup)

;; Show matching parentheses
(show-paren-mode 1)

;; Load Theme
;;
(setq theme-file "~/themes/emacs/vs-dark-theme.el")
 (when (file-exists-p theme-file)
   (load theme-file)
   (vs-dark-theme))

;; Keys
;;

;; - Ctrl+C
(global-set-key (kbd "C-c") 'kill-ring-save) 
;; - Ctrl+X
(global-set-key (kbd "C-k") 'kill-region) 
;; - Ctrl+Y
(global-set-key (kbd "C-v") 'yank)
;;      (global-set-key (kbd "s-Insert") 'yank) 
;; - Ctrl+S (Speichern)
(global-set-key (kbd "C-s") 'save-buffer) 
;; - Ctrl+O (find file)
(global-set-key (kbd "C-o") 'helm-find-files) 
;; - Ctrl+F (Swiper)
(global-set-key (kbd "C-f") 'swiper) 
;; Comment region
(global-set-key (kbd "C-/") 'comment-region)
;; Quit
(global-set-key (kbd "C-q") 'save-buffers-kill-terminal)
;; Find files
(global-set-key (kbd "C-#") 'helm-find)
;; Search in current folder
(global-set-key (kbd "<f3>") 'helm-rg)
(global-set-key (kbd "<f5>") 'helm-M-x)
;; Find word under cursor
(global-set-key (kbd "<f4>") 'swiper-thing-at-point)
;; Bookmark support
(global-set-key (kbd "<f7>") 'helm-mini)
(global-set-key (kbd "<f8>") 'magit)
(global-set-key (kbd "<f9>") 'helm-recentf)
(global-set-key (kbd "<f11>") 'helm-buffers-list)
;; Find definition(s) using dumb-jump
(global-set-key (kbd "<f12>") 'dumb-jump-go)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "C-w") 'delete-window)
(global-set-key (kbd "C-2") 'split-window-right)
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "C-<f11>") 'helm-bookmarks)
(global-set-key (kbd "C-<f12>") 'helm-imenu)

;; Load emacs custom settings
(load custom-file)

