;; Emacs Config 2021.1

;; Enable backtrace if something goes wrong
(setq debug-on-error t)

;; Required packages (used by pd/install-packages)
(defvar my-packages '(
                      ag
                      rg
                      cmake-mode
                      magit
                      swiper
                      swiper-helm
                      helm
                      helm-rg
                      helm-rhythmbox
                      iedit
                      dumb-jump
                      docker
                      elfeed
                      elfeed-goodies
                      fzf
                      helm-ag
                      org-bullets
                      auto-complete
                      multiple-cursors
                      projectile
                      helm-projectile
                      which-key
                      dockerfile-mode
                      mood-one-theme
                      typescript-mode
                      vue-mode
                      company
                      flycheck
                      exec-path-from-shell
                      rubocop
                      yaml-mode
                      cider
                      crux
                      deadgrep
                      key-chord
                      protobuf-mode
                      go-mode
                      tide
                      lsp-mode
                      lsp-ui
                      helm-lsp
                      dap-mode
                      cobol-mode
                      helm-rails
                      ))

;; Required by package.el.
(require 'package)
(package-initialize)

;; Thanks to http://blog.binchen.org/posts/easy-indentation-setup-in-emacs-for-web-development.html
(defun pd/setup-indent-level (n)
  (setq c-basic-offset n) ;; java + c/c++
  (setq coffee-tab-width n)
  (setq javascript-indent-level n)
  (setq js-indent-level n)
  (setq js2-basic-offset n)
  (setq web-mode-markup-indent-offset n)
  (setq web-mode-css-indent-offset n)
  (setq web-mode-code-indent-offset n)
  (setq css-indent-offset n))

(defun pd/open-today-todo-file ()
  "Open todo file for today"
  (interactive)
  (find-file (concat  (getenv "TODO") "/" (format-time-string "%Y%m%d.org.gpg")))
  (org-mode))

;; Thanks to https://sachachua.com/blog/2006/09/emacs-changing-the-font-size-on-the-fly/
(defun pd/multiply-font-size (factor)
    (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* factor
                                  (face-attribute 'default :height)))))

(defun pd/increase-font-size ()
  (interactive)
  (pd/multiply-font-size 1.10))

(defun pd/decrease-font-size ()
  (interactive)
  (pd/multiply-font-size 0.9))

(defun pd/create-empty-buffer ()
  (interactive)
  (let ((buffer (generate-new-buffer "untitled")))
    (set-buffer-major-mode buffer)
    (switch-to-buffer buffer)))

;; Thanks to https://stackoverflow.com/a/25942392 (@itsjeyd)
(defun org-toggle-todo-and-fold ()
  (interactive)
  (save-excursion
    (org-back-to-heading t) ;; Make sure command works even if point is
                            ;; below target heading
    (cond ((looking-at "\*+ TODO")
           (org-todo "DONE")
           (hide-subtree))
          ((looking-at "\*+ DONE")
           (org-todo "TODO")
           (hide-subtree))
          (t (message "Can only toggle between TODO and DONE.")))))

;; Install packages - this is in its own function to control
;; Internet / Proxy access.
(defun pd/install-packages ()
  "Installs the packages defined in my-packages"
  (interactive)
  (package-refresh-contents)
  (dolist (p my-packages)
    (unless (package-installed-p p)
      (package-install p))
    (add-to-list 'package-selected-packages p)))

(defun pd/start-terminal-in-current-folder ()
  "Starts a terminal in the current file's folder."
  (interactive)
  (setq default-directory (file-name-directory buffer-file-name))
  (start-process "gnome-terminal" nil "gnome-terminal"))

;; Package sources
(setq package-archives '(
			 ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ))

;; Helm config
(require 'helm-config)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line        t
      helm-move-to-line-cycle-in-source     nil)

(helm-mode 1)

;; ido-mode (mostly for default find file functionality)
(ido-mode 1)

;; Toolbar off
(tool-bar-mode -1)

;; Menu bar off
(menu-bar-mode -1)

;; Set count of recent file list
(setq recentf-max-menu-items 1000)
(setq recentf-max-saved-items 1000)

;; Show current line and column in mode line
(setq line-number-mode t)
(setq column-number-mode t)

;; Make shift selection work in org-mode
(setq org-replace-disputed-keys t)

;; Only visible bell
(setq visible-bell t)

;; Customize backup file creation
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Font
;;(set-frame-font "Courier 15" nil t)
;;(set-frame-font "Monospace 14" nil t)
;;(set-frame-font "Nimbus Mono PS 15" nil t)
;;(set-frame-font "More Perfect DOS VGA 15" nil t)
(set-frame-font "Fira Code 10" nil t)

;; No backup files
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; Confirm before closing emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Sentences have one space after the period
(setq sentence-end-double-space nil)

;; Line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Symlinks
(setq vc-follow-symlinks nil)

;; Human readable units in dired
(setq-default dired-listing-switches "-alh")

;; Make recursive copies default in dired
(setq dired-recursive-copies 'always)

;; Disable all lock files
(setq create-lockfiles nil)

;; Ask for y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable auto complete with default settings
(ac-config-default)

;; No scroll bars
(scroll-bar-mode -1)

;; Encrypt gpg files automatically
(require 'epa-file)
(epa-file-enable)

;; Only spaces, no tabs
(setq tab-width 2)
(setq-default indent-tabs-mode nil)

;; Set initial window size
(setq initial-frame-alist '((width . 130) (height . 60)))

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
(setq feeds-file "~/feeds.el")
(when (file-exists-p feeds-file)
  (load feeds-file))
(elfeed-goodies/setup)

;; Show matching parentheses
(show-paren-mode 1)

;; Format bullets in org mode.
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Keys
(global-set-key (kbd "M-w") 'kill-ring-save)
(global-set-key (kbd "C-w") 'kill-region)
(global-set-key (kbd "C-y") 'yank)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-o") 'helm-find-files)
(global-set-key (kbd "C-f") 'swiper-helm)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-#") 'fzf)
(global-set-key (kbd "C-S-p") 'projectile-find-file)
(global-set-key (kbd "<f3>") 'deadgrep)
(global-set-key (kbd "S-<f3>") 'projectile-ag)
(global-set-key (kbd "<f4>") 'swiper-thing-at-point)
(global-set-key (kbd "<f5>") 'helm-M-x)
(global-set-key (kbd "<f6>") 'helm-mini)
(global-set-key (kbd "<f7>") 'compile)
(global-set-key (kbd "<f8>") 'magit)
(global-set-key (kbd "<f9>") 'helm-recentf)
(global-set-key (kbd "<f10>") 'pd/open-today-todo-file)
(global-set-key (kbd "<f11>") 'helm-buffers-list)
(global-set-key (kbd "<f12>") 'dumb-jump-go)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "C-<f11>") 'helm-bookmarks)
(global-set-key (kbd "C-<f12>") 'helm-imenu)
(global-set-key (kbd "C-S-s") 'ido-write-file)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-d") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-l") 'mc/edit-lines)
(global-set-key (kbd "C-+") 'projectile-find-other-file)
(global-set-key (kbd "C-M-+") 'pd/increase-font-size)
(global-set-key (kbd "C-M--") 'pd/decrease-font-size)
(global-set-key (kbd "C-SPC") 'company-complete-selection)
(global-set-key (kbd "M-S-<up>") 'crux-switch-to-previous-buffer)
(global-set-key (kbd "M-S-<down>") 'next-buffer)
(global-set-key (kbd "C-c o") 'crux-open-with)
(global-set-key (kbd "C-<insert>") 'crux-smart-open-line-above)
(global-set-key (kbd "M-k") 'crux-kill-whole-line)
(global-set-key (kbd "C-n") 'pd/create-empty-buffer)
(global-set-key (kbd "C-<f10>") 'helm-rhythmbox)
(global-set-key (kbd "C-0") 'helm-show-kill-ring)
(global-set-key (kbd "C-1") 'helm-calcul-expression)
(global-set-key (kbd "C-2") 'split-window-right)
(global-set-key (kbd "C-3") 'helm-man-woman)
(global-set-key (kbd "C-4") 'helm-top)
(global-set-key (kbd "C-<f5>") 'pd/start-terminal-in-current-folder)
(global-set-key (kbd "C-<down>") 'forward-paragraph)
(global-set-key (kbd "C-<up>") 'backward-paragraph)
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)

(key-chord-define-global "kk" 'kill-current-buffer)
(key-chord-define-global "kw" 'delete-window)

(define-key org-mode-map (kbd "C-<f12>") 'org-toggle-todo-and-fold)

;; Make tab key work for helm-find-files
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)

;; Load emacs custom settings
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(load-theme 'mood-one)
;;(load-theme 'adwaita)

;; Highlight current line
(global-hl-line-mode 1)
;;(set-face-background 'hl-line "#BBBBBB") ;; for adwaita theme
(set-face-foreground 'highlight nil)

;; Projectile settings
(projectile-mode +1)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)

;; Make env available
(exec-path-from-shell-copy-env "TODO")
(exec-path-from-shell-initialize)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Company (completion) mode everywhere
(add-hook 'after-init-hook 'global-company-mode)
;; Global Syntax checking
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'helm-projectile)
(helm-projectile-on)

(pd/setup-indent-level 2)

(which-key-mode)

(key-chord-mode 1)

;; LSP
(setq lsp-keymap-prefix "C-c l")
(require 'lsp-mode)
;;(add-hook 'prog-mode-hook #'lsp)

;; No startup screen
(setq inhibit-startup-screen t)
