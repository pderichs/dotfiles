; emacs initialization file.
; patderichs@gmail.com
;

; Set the correct environment for bash commands
(setq shell-file-name "zsh")
(setq shell-command-switch "-ic")

; Repositories to be used
(require 'package)
(add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

; Install required packages
(defvar required-packages
  '(
    ag
    magit
    yasnippet
    projectile
    ruby-end
    helm
    flx-ido
    go-mode
    helm-projectile
    helm-ag
    ace-jump-mode
    auto-complete
    zencoding-mode
    rbenv
    rubocop
    rspec-mode
    multiple-cursors
    exec-path-from-shell
    yaml-mode
    neotree
    editorconfig
    ) "a list of packages to ensure are installed at launch.")

(require 'cl)

; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

; Enable smooth scrolling.
; (setq redisplay-dont-pause t
;   scroll-margin 1
;   scroll-step 1
;   scroll-conservatively 10000
;   scroll-preserve-screen-position 1)

; Show line numbers.
(global-linum-mode 1)

; Auto indentation.
(global-set-key "\C-m" 'newline-and-indent)

; Tab size is 2.
(setq default-tab-width 2)
(setq js-indent-level 2)
(setq css-indent-offset 2)

; No tabs (we want spaces instead).
(setq-default indent-tabs-mode nil)

; No auto-indentation
(setq electric-indent-mode nil)

; No line wrap.
(setq-default truncate-lines 1)

; Show matching brackets
(show-paren-mode 1)


; Remove trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Line numbers to the left
;(global-linum-mode t)

; Selection should be deleted when typing
(delete-selection-mode 1)

; Highlight entire bracket content when cursor is inside
;(setq show-paren-style 'expression)

; All files should be reloaded when the content change on disk.
(global-auto-revert-mode t)

; Highlight lines with more than 80 chars
(add-hook 'ruby-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-red-b)))

; No ~ temp files
(setq make-backup-files nil)

; No #autosave# files
(setq auto-save-default nil)

; We like brackets auto-paired
(electric-pair-mode 1)

; Don't use yes or no, we want y or n
(defalias 'yes-or-no-p 'y-or-n-p)

; Enable yasnippets globally
(yas-global-mode t)

; Showing complete file path in title bar
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

; No menu bar.
(menu-bar-mode -1)

; No toolbar.
(tool-bar-mode -1)

; Load wombat theme
(load-theme 'wombat)
; Cyperpunk theme
;(load-theme 'cyberpunk t)
; Loading badwolf theme
;(load-file (expand-file-name "themes/badwolf-theme.el" user-emacs-directory))

; Highlight current line
;(global-hl-line-mode 1)
;(set-face-background 'hl-line "#223")

; Enhance font-size for graphical emacs.
(set-face-attribute 'default nil :height 110)

; Set initial window size
(add-hook 'after-init-hook '(lambda ()
                              (when window-system (set-frame-size (selected-frame) 180 45))
                              ))

; Line numbers on
(line-number-mode 1)

; Format line numbers
(setq linum-format "%6d \u2502 ")

; Columns on
(column-number-mode 1)

; Suppress emacs startup screen
(setq inhibit-startup-message t)

; Load extension "ido-mode"
(require 'ido)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode 1)

; Enable flx ido mode (fuzzy matching)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

; Make recent file list available to ido
(recentf-mode 1)
(setq ido-virtual-buffers t
      recentf-max-saved-items 1000)

; activate Desktop mode to reopen recent files automatically
;(desktop-save-mode 1)

; Enable ruby-electric when entering ruby mode
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

; Enable robe mode when entering ruby mode
(add-hook 'ruby-mode-hook 'robe-mode)

; Ruby mode for following files
; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

; No encoding comment
(setq ruby-insert-encoding-magic-comment nil)

; Enabling ruby-end-mode
(ruby-end-mode 1)

; Enable rbenv
(global-rbenv-mode)

; Command is Meta. Enable meta key of mac for brackets
;(setq default-input-method "MacOSX")
(when (eq system-type 'darwin)
  ; Move modifier and meta keys
  (setq mac-command-modifier 'meta)
  ; (setq mac-option-modifier nil)
  ; (setq ns-function-modifier 'control)
  ; (setq ns-alternate-modifier 'control)
  (setq ns-right-alternate-modifier nil)
  (global-set-key [kp-delete] 'delete-char))

; Projectile
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

; Helm-projectile mode
(require 'helm-projectile)
(helm-projectile-on)

; Keys

; Set meta key according to environment
(if (string= (getenv "ENV_CMD_META") "1")
    (defun env-meta () "s")
  (defun env-meta () "M"))

; General key bindings
(global-set-key (kbd (concat (env-meta) "-q")) 'save-buffers-kill-emacs)

; Moving between windows
(global-set-key (kbd (concat (env-meta) "--")) 'previous-multiframe-window)
(global-set-key (kbd "C-o") 'previous-multiframe-window)

; Use helm-M-x
(global-set-key (kbd (concat (env-meta) "-x")) 'helm-M-x)
; using helm-m-x instead of the default implementation
;(global-set-key (kbd (concat (env-meta) "-x")) 'helm-M-x)

; Ace jump mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

; Major key binding (navigation, project management etc...)
(global-set-key (kbd (concat (env-meta) "-1")) 'projectile-switch-project)
(global-set-key (kbd (concat (env-meta) "-2")) 'helm-mini)
(global-set-key (kbd (concat (env-meta) "-4")) 'helm-projectile-switch-to-buffer)

(global-set-key (kbd (concat (env-meta) "-5")) 'kmacro-start-macro)
(global-set-key (kbd (concat (env-meta) "-6")) 'kmacro-end-macro)
(global-set-key (kbd (concat (env-meta) "-7")) 'kmacro-end-and-call-macro)

(global-set-key (kbd (concat (env-meta) "-8")) 'projectile-invalidate-cache)

; Search
(global-set-key (kbd "C-f") 'helm-ag-this-file)
(global-set-key (kbd "C-e") 'helm-ag-buffers)
(global-set-key (kbd (concat "C-" (env-meta) "-f")) 'helm-ag-project-root)
(global-set-key (kbd "C-S-s") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "C-ü") 'highlight-symbol-at-point)

(global-set-key (kbd (concat (env-meta) "-p")) 'projectile-find-file)

(global-set-key (kbd "C-7") 'mc/edit-lines)
(global-set-key (kbd "C-8") 'mc/mark-next-like-this)
(global-set-key (kbd "C-9") 'mc/mark-all-like-this)

(global-set-key (kbd (concat (env-meta) "-o"))   'ido-find-file)
(global-set-key (kbd (concat (env-meta) "-ö"))   'ido-find-file)

; Sublime like settings
(global-set-key (kbd (concat (env-meta) "-d"))   'mc/mark-next-like-this)
(global-set-key (kbd "C-M-g") 'mc/mark-all-like-this)
(global-set-key (kbd (concat (env-meta) "-s"))   'save-buffer)
(global-set-key (kbd (concat (env-meta) "-L"))   'mc/edit-lines)
(global-set-key (kbd (concat (env-meta) "-p"))   'projectile-find-file)
(global-set-key (kbd (concat (env-meta) "-r"))   'helm-semantic-or-imenu)

(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-u") 'uncomment-region)

; Easy buffer switch
(global-set-key (kbd "C-b") 'projectile-switch-to-buffer)

(global-set-key (kbd (concat (env-meta) "-,")) 'magit-status)

(global-set-key (kbd "M-g") 'goto-line)

; Bring back org-mode shift select
(setq org-support-shift-select 'always)

; These files are HTML
(add-to-list 'auto-mode-alist '("\\.jst.eco$" . html-mode))

; C++ Style
(setq-default c-basic-offset 2 c-default-style "linux")

; Auto complete mode
(global-auto-complete-mode t)

(setq ac-auto-start t)
(setq ac-delay 0.1)
; (setq ac-auto-show-menu nil)
; (setq ac-show-menu-immediately-on-auto-complete t)
; (setq ac-trigger-key nil)

; Setting PATH
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "TODO"))

(when (eq system-type "gnu/linux")
  (setq home (getenv "HOME"))
  (setq paths
        (list
          (concat home "/go/bin")
          (concat home "/.rbenv/shims")
          (concat home "/rbenv/bin")
          "/usr/local/bin"
          "/usr/bin"
          "/bin"
          "/usr/sbin"
          "/sbin"
           (getenv "PATH")
          ))
  (setenv "PATH"
          (mapconcat 'identity
           paths ":")))

; Always follow symlinks
(setq vc-follow-symlinks t)

; Open current todo file in other window
(split-window-horizontally)
(next-multiframe-window)
(find-file (concat  (getenv "TODO") "/" (format-time-string "%Y%m%d.txt")))
(org-mode)
(previous-multiframe-window)

; Stop emacs from writing custom settings to this file
(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
;(when (file-exists-p custom-file)
;  (load custom-file))
