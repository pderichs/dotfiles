;; Patricks Emacs Config
;;
;; 0.0.4 (20230429)
;; 2023 (c) pderichs (derichs@posteo.de)
;; Licensed under the terms of GPLv3:
;;   https://www.gnu.org/licenses/gpl-3.0.en.html

;; Enable backtrace if something goes wrong
(setq debug-on-error t)

;; Start interactive zsh shell.
(if (not (eq system-type 'windows-nt))
    (setq shell-file-name "zsh")
  (setq shell-command-switch "-ic"))

;; ;; See
;; ;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
;; ;; https://github.com/QubesOS/qubes-issues/issues/2057
;; ;;
;; ;; Config: https://github.com/admiralakber/myOS-emacs/blob/master/config/config.el
;; (require 'epg-config)
;; (setq epg-debug t)
;; (custom-set-variables
;;  '(epg-gpg-program "/usr/bin/qubes-gpg-client-wrapper"))
;; (setenv "QUBES_GPG_DOMAIN" "gpg")
;; (push (cons 'OpenPGP (epg-config--make-gpg-configuration epg-gpg-program))
;;       epg--configurations)
;; (setq package-gnupghome-dir nil)
;; (setq auto-save-default nil)   ;; Auto saving of decrypted files is a security flaw, never risk

;; Some keys are defined right here, so we have these
;; basic key shortcuts available in case if something
;; in the config is failing.
(global-set-key (kbd "C-o") 'ido-find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "<f5>") 'execute-extended-command)
(global-set-key (kbd "C-<f4>") 'kill-current-buffer)
(global-set-key (kbd "C-<down>") 'forward-paragraph)
(global-set-key (kbd "C-<up>") 'backward-paragraph)
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)
(global-set-key (kbd "C-<right>") 'forward-word)
(global-set-key (kbd "C-<left>") 'backward-word)
(global-set-key (kbd "C-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "M-S-<left>") 'back-button-global-backward)
(global-set-key (kbd "M-S-<right>") 'back-button-global-forward)
(global-set-key (kbd "<f2>") 'er/expand-region)
(global-set-key (kbd "M-w") 'kill-ring-save)
(global-set-key (kbd "C-w") 'kill-region)
(global-set-key (kbd "C-y") 'yank)
(global-set-key (kbd "C-<f2>") 'list-matching-lines)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-s") 'ido-write-file)
(global-set-key (kbd "M-S-<down>") 'next-buffer)
(global-set-key (kbd "C-1") 'windmove-left)
(global-set-key (kbd "C-2") 'windmove-right)
(global-set-key (kbd "S-<f5>") 'eval-region)
(global-set-key (kbd "C-<f5>") 'kmacro-call-macro)
(global-set-key (kbd "C-<f7>") 'kmacro-start-macro)
(global-set-key (kbd "C-<f8>") 'kmacro-end-macro)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Required by package.el.
(require 'package)
(package-initialize)

;; Package sources
(setq package-archives '(
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; --- START Packages

(use-package exec-path-from-shell
  :ensure t
  :config
  (if (not (string-equal system-type "windows-nt"))
      (exec-path-from-shell-initialize)))

(use-package cmake-mode
  :ensure t)

(use-package goto-last-change
  :ensure t)

(use-package smartparens
  :ensure t)

(use-package doom-themes
  :ensure t)

(use-package magit
  :ensure t)

(use-package swiper
  :ensure t)

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package recentf
  :custom
  (recentf-max-menu-items 1000)
  (recentf-max-saved-items 1000)

  :config
  (recentf-mode 1))

(use-package iedit
  :ensure t)

(use-package dumb-jump
  :ensure t)

(use-package docker
  :ensure t)

(use-package elfeed
  :ensure t)

(use-package elfeed-goodies
  :ensure t)

(use-package fzf
  :ensure t)

(use-package org-bullets
  :ensure t)

(use-package multiple-cursors
  :ensure t)

(use-package projectile
  :ensure t

  :custom
  (projectile-enable-caching t)
  (projectile-indexing-method 'native)

  :config
  (projectile-mode +1))

(use-package which-key
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package typescript-mode
  :ensure t)

(use-package vue-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package crux
  :ensure t)

(use-package deadgrep
  :ensure t)

(use-package protobuf-mode
  :ensure t)

(use-package tide
  :ensure t)

(use-package dap-mode
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package auto-complete
  :ensure t)

(use-package avy
  :ensure t)

(use-package vertico
  :ensure t
  :config
  (vertico-mode))

(use-package consult
  :ensure t

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI. You may want to also
  ;; enable `consult-preview-at-point-mode` in Embark Collect buffers.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless)))

(use-package embark
  :ensure t

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package consult-projectile
  :ensure t)

;; for e.g. counsel-find-file, counsel-ag
(use-package counsel
  :ensure t)

(use-package highlight-symbol
  :ensure t)

(use-package markdown-mode
  :ensure t

  :commands
  (markdown-mode gfm-mode)

  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))

  :init
  (setq markdown-command "multimarkdown"))

(use-package back-button
  :ensure t)

(use-package expand-region
  :ensure t)

(use-package restart-emacs
  :ensure t)

(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))


(use-package lsp-mode
  :ensure t

  :init
  ;; set prefix for lsp-command-keymap
  (setq lsp-keymap-prefix "C-c l")

  :hook
  ;; replace XXX-mode with concrete major-mode(e. g. python-mode)
  (
   ;; Enable LSP for these modes / languages
   (c-mode . lsp)
   (c++-mode . lsp)

   (lsp-mode . lsp-enable-which-key-integration))

  :commands lsp
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package flycheck
  :ensure t)

(use-package company
  :ensure t)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package dap-mode
  :ensure t)

;; --- END Packages

(defun pd/theme ()
  "Sets the theme"
  (interactive)
  (if (string= (system-name) "development")
      (load-theme 'leuven t)
    (load-theme 'doom-opera-light))
  ;;(set-face-background 'hl-line "#000000")
  )

;; ----------------------------------------------------------------------------------------------------
;; Custom tool functions
;; ----------------------------------------------------------------------------------------------------

;; Thanks to http://blog.binchen.org/posts/easy-indentation-setup-in-emacs-for-web-development.html
(defun pd/setup-indent-level (n)
  "Sets the indent level for multiple languages to n."
  (setq c-basic-offset n) ;; java + c/c++
  (setq coffee-tab-width n)
  (setq javascript-indent-level n)
  (setq js-indent-level n)
  (setq js2-basic-offset n)
  (setq web-mode-markup-indent-offset n)
  (setq web-mode-css-indent-offset n)
  (setq web-mode-code-indent-offset n)
  (setq css-indent-offset n))

;; Thanks to https://www.reddit.com/r/emacs/comments/1xe7vr/check_if_font_is_available_before_setting
(defun font-exists-p (font)
  "check if font exists"
  (if (null (x-list-fonts font)) nil t))

;; Thanks to https://www.emacswiki.org/emacs/SwitchingBuffers
(defun pd/transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

;; Thanks to https://sachachua.com/blog/2006/09/emacs-changing-the-font-size-on-the-fly/
(defun pd/multiply-font-size (factor)
  "Helper function for font size adjustment."
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* factor
                                  (face-attribute 'default :height)))))

(defun pd/increase-font-size ()
  "Increases the font size by 1.10."
  (interactive)
  (pd/multiply-font-size 1.10))

(defun pd/decrease-font-size ()
  "Decreases the font size by 0.9."
  (interactive)
  (pd/multiply-font-size 0.9))

(defun pd/create-empty-buffer ()
  "Creates a new empty buffer."
  (interactive)
  (let ((buffer (generate-new-buffer "untitled")))
    (set-buffer-major-mode buffer)
    (switch-to-buffer buffer)))

;; Thanks to https://web.cs.elte.hu/local/texinfo/elisp-intro/emacs-lisp-intro_132.html
(defun debug-print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))

(defun pd/open-today-todo-file ()
  "Open todo file for today"
  (interactive)
  (find-file (concat  (getenv "TODO") "/" (format-time-string "%Y%m%d.org.gpg")))
  (org-mode))

(defun pd/open-notes-file ()
  "Open todo file for today"
  (interactive)
  (find-file (concat (getenv "HOME") "/patrick/documents/notizen/notizen.org.gpg"))
  (org-mode))

(defun pd/start-terminal-in-current-folder ()
  "Starts a terminal in the current file's folder."
  (interactive)
  (setq default-directory (file-name-directory buffer-file-name))
  (start-process (getenv "TERMINAL") nil (getenv "TERMINAL")))

(defun pd/create-todays-todo-file (todo-file-name)
  "Checks if the todo file for today is existing - if not it will copy the contents from the last file."
  (let ((today-todo-file-path (concat  (getenv "TODO") "/" todo-file-name)))
    (if (not (file-exists-p today-todo-file-path))
        (let ((existing-todo-files (directory-files (getenv "TODO") nil "\.org.gpg$" nil)))
          (if existing-todo-files
              (copy-file (concat (getenv "TODO") "/" (car (last existing-todo-files))) today-todo-file-path))))))

(defun pd/search-string-in-folder ()
  "Searches for a string in a specific folder."
  (interactive)
  (let ((folder-to-search-in (read-directory-name "Search for string in Directory:")))
    (unless (string= "" folder-to-search-in)
      (consult-ripgrep folder-to-search-in))))

(defun pd/search-file-in-folder ()
  "Searches for a string in a specific folder."
  (interactive)
  (let ((folder-to-search-in (read-directory-name "Search for a file in Directory:")))
    (unless (string= "" folder-to-search-in)
      (consult-find folder-to-search-in))))

;; Thanks to https://stackoverflow.com/a/16127347
(defun pd/my-root-dir ()
  "Retrieves the source control root dir of the current file."
  (let ((path (file-name-directory buffer-file-name)))
    (vc-call-backend (vc-responsible-backend path) 'root path)))

(defun pd/compile-from-vc-root-folder (x-compile-command)
  "Runs compile within the vc root folder."
  (interactive)
  (let ((root-dir (pd/my-root-dir)))
    (if (eq root-dir nil)
        (message "*** Root dir is nil! Aborting.")
      (progn
        (setq default-directory root-dir)
        (compile x-compile-command)))))

(defun pd/cpp-insert-header-guard ()
  "Inserts a header guard"
  (interactive)
  (let ((name (upcase (read-string "Guard identifier: "))))
    (insert "#ifndef " name "_INCLUDED")
    (newline)
    (insert "#define " name "_INCLUDED")
    (newline)
    (newline)
    (insert "#endif")
    (previous-line)))

(defun pd/cpp-include-file-candidates (dir)
  "Returns a list which combines default and local include files"
  (let* ((system-includes
          (list
           (list "vector" t)
           (list "list" t)
           (list "deque" t)
           (list "limits" t)
           (list "iostream" t)
           (list "fstream" t)
           (list "sstream" t)
           (list "set" t)
           (list "map" t)
           (list "functional" t)
           (list "tuple" t)
           (list "memory" t)
           (list "string" t)
           (list "queue" t)
           (list "ostream" t)
           (list "iterator" t)
           (list "stdexcept" t)
           (list "regex" t)
           (list "cstdlib" t)
           (list "algorithm" t)
           (list "cmath" t)
           (list "math.h" t)
           (list "stdio.h" t)
           (list "string.h" t)
           (list "stdlib.h" t)
           (list "memory.h" t)
           (list "malloc.h" t)
           ))
         (local-header-files
          (f-files dir
                   (lambda (file) (string= (f-ext file) "h"))
                   t)
          )
         (local-includes
          (mapcar (lambda (dateiname) (list (f-filename dateiname) nil))
                  local-header-files)
          ))
    (append system-includes
            local-includes)
    ))

(defun pd/cpp-insert-include ()
  "Inserts include statement"
  (interactive)
  (let* ((possible-include-files-with-sys-flag (pd/cpp-include-file-candidates default-directory))
         (include_file_name (assoc (completing-read "Include file name: " possible-include-files-with-sys-flag) possible-include-files-with-sys-flag))
         (is-system-include (cadr include_file_name))
         (surrounding (if is-system-include '("<" ">") '("\"" "\""))))
    (insert "#include " (car surrounding) (car include_file_name) (car (cdr surrounding)))
    (newline)))

(defun pd/insert-date ()
  "Inserts the current date"
  (interactive)
  (insert (format-time-string "%Y.%m.%d"))
  (newline))

(defun pd/insert-line ()
  "Inserts a line"
  (interactive)
  (insert (make-string 60 ?-))
  (newline))

;; Thanks to https://stackoverflow.com/a/25942392 (@itsjeyd)
(defun org-toggle-todo-and-fold ()
  "Toggles between TODO and DONE on a item in org mode."
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

;; Thanks to https://www.emacswiki.org/emacs/SurroundRegion
(defun pd/surround (begin end open close)
  "Put OPEN at START and CLOSE at END of the region.
If you omit CLOSE, it will reuse OPEN."
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list nil nil)))
  (when (string= close "")
    (setq close open))
  (save-excursion
    (goto-char end)
    (insert close)
    (goto-char begin)
    (insert open)))

;; Toolbar off
(tool-bar-mode -1)

;; Menu bar off
(menu-bar-mode -1)

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
(if (not (boundp 'my-font))
    (setq my-font "Hack 11"))
(when window-system
  (if (font-exists-p my-font)
      (set-frame-font my-font nil t)
    (set-frame-font "Monospace 16" nil t)))

;; No backup files
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; Confirm before closing emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Sentences have one space after the period
(setq sentence-end-double-space nil)

;; Line numbers
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; Symlinks
(setq vc-follow-symlinks t)

;; Human readable units in dired
(setq-default dired-listing-switches "-alh")

;; Make recursive copies default in dired
(setq dired-recursive-copies 'always)

;; Disable all lock files
(setq create-lockfiles nil)

;; Ask for y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; No scroll bars
(scroll-bar-mode -1)

;; Encrypt gpg files automatically
(require 'epa-file)
(epa-file-enable)

;; Only spaces, no tabs
(setq tab-width 2)
(setq-default indent-tabs-mode nil)

;; Split screen on startup
;;(split-window-right)

;; Show full file path in title bar
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Configure fortune (https://www.emacswiki.org/emacs/Fortune)
(setq fortune-dir "/usr/share/games/fortune")
(setq fortune-file "/usr/share/games/fortune/bofh-excuses")

;; Increase kill ring max
(setq kill-ring-max 100)

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
(global-set-key (kbd "<f7>") (lambda () (interactive) (pd/compile-from-vc-root-folder "make -k")))
(global-set-key (kbd "S-<f7>") (lambda () (interactive) (pd/compile-from-vc-root-folder "make --jobs tests")))
(global-set-key (kbd "<f12>") 'xref-find-definitions-other-window)
(global-set-key (kbd "C-<f12>") 'consult-imenu)
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "C-<") 'transpose-buffers)
(global-set-key (kbd "C-S-<f1>") 'browse-url)
(global-set-key (kbd "C-<f9>") 'narrow-to-region)
(global-set-key (kbd "C-<f10>") 'widen)
(global-set-key (kbd "<f8>") 'magit)
(global-set-key (kbd "C-S-f") 'ivy-resume)
(global-set-key (kbd "<f4>") 'swiper-thing-at-point)
(global-set-key (kbd "C-S-p") 'counsel-fzf)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-d") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-l") 'mc/edit-lines)
(global-set-key (kbd "C-p") 'counsel-fzf)
(global-set-key (kbd "S-<f3>") 'projectile-ag)
(global-set-key (kbd "C-+") 'projectile-find-other-file)
(global-set-key (kbd "M-S-<up>") 'crux-switch-to-previous-buffer)
(global-set-key (kbd "C-c o") 'crux-open-with)
(global-set-key (kbd "C-<insert>") 'crux-smart-open-line-above)
(global-set-key (kbd "M-k") 'crux-kill-whole-line)
(global-set-key (kbd "C-<f3>") 'deadgrep)
(global-set-key (kbd "C-SPC") 'auto-complete) ;; alt: hippie-expand
(global-set-key (kbd "<f3>") 'consult-ripgrep)
(global-set-key (kbd "<f9>") 'consult-recent-file)
(global-set-key (kbd "<f11>") 'consult-buffer)
(global-set-key (kbd "C-<f11>") 'consult-bookmark)
(global-set-key (kbd "C-0") 'consult-yank-from-kill-ring)
(global-set-key (kbd "C-S-g") 'consult-goto-line)
(global-set-key (kbd "C-3") 'consult-man)
(global-set-key (kbd "C-.") 'embark-act)
(global-set-key (kbd "C-;") 'embark-dwim) ;; good alternative: M-.
(global-set-key (kbd "C-h B") 'embark-bindings) ;; alternative for `describe-bindings'
(global-set-key (kbd "C-o") 'counsel-find-file)
(global-set-key (kbd "C-f") 'counsel-grep-or-swiper) ;; use M-p to repeat last search
(global-set-key (kbd "C-S-<f3>") 'counsel-rg)
(global-set-key (kbd "C-5") 'highlight-symbol)
(global-set-key (kbd "C-6") 'highlight-symbol-prev)
(global-set-key (kbd "C-7") 'highlight-symbol-next)

;; Keys prefix map
(define-prefix-command 'pd-command-map)
(global-set-key (kbd "C-<return>") 'pd-command-map)
(define-key pd-command-map (kbd "/") 'counsel-rg)
(define-key pd-command-map (kbd "a g") 'counsel-ag)
(define-key pd-command-map (kbd "w w") 'other-window)
(define-key pd-command-map (kbd "w d") 'delete-window)
(define-key pd-command-map (kbd "w /") 'split-window-right)
(define-key pd-command-map (kbd "w -") 'split-window-below)
(define-key pd-command-map (kbd "f f") 'counsel-find-file)
(define-key pd-command-map (kbd "q q") 'save-buffers-kill-terminal)
(define-key pd-command-map (kbd "q r") 'restart-emacs)
(define-key pd-command-map (kbd "p p") 'projectile-switch-project)
(define-key pd-command-map (kbd "p f") 'projectile-find-file)
(define-key pd-command-map (kbd "s s") 'counsel-grep-or-swiper)
(define-key pd-command-map (kbd "*") 'counsel-rg) ;; TODO: Grep thing at point (swiper? fzf?)
(define-key pd-command-map (kbd "S") 'ivy-resume)
(define-key pd-command-map (kbd "j i") 'consult-imenu)
(define-key pd-command-map (kbd "s b") 'consult-bookmark)
(define-key pd-command-map (kbd "f b") 'consult-bookmark)
(define-key pd-command-map (kbd "l b") 'list-bookmarks)
(define-key pd-command-map (kbd "o f") 'projectile-find-other-file)
(define-key pd-command-map (kbd "-") 'consult-register)
(define-key pd-command-map (kbd "p l") 'consult-yank-from-kill-ring)
(define-key pd-command-map (kbd "[") 'pd/search-string-in-folder)
(define-key pd-command-map (kbd "]") 'pd/search-file-in-folder)
(define-key pd-command-map (kbd "k k") 'kill-current-buffer)
(define-key pd-command-map (kbd "c c") 'compile)
(define-key pd-command-map (kbd "l c") 'goto-last-change)
;;(define-key pd-command-map (kbd "c f") ') ; TODO formats the whole file
(define-key pd-command-map (kbd "i d") 'pd/insert-date)
(define-key pd-command-map (kbd "i l") 'pd/insert-line)
(define-key pd-command-map (kbd "m n") 'mc/mark-next-like-this)
(define-key pd-command-map (kbd "m a") 'mc/mark-all-like-this)
(define-key pd-command-map (kbd "h h") 'mark-whole-buffer)
(define-key pd-command-map (kbd "b n") 'pd/create-empty-buffer)
(define-key pd-command-map (kbd "b b") 'consult-buffer)
(define-key pd-command-map (kbd "h t") 'consult-theme)
(define-key pd-command-map (kbd "g g") 'magit-status)
(define-key pd-command-map (kbd "g r") 'consult-grep)
(define-key pd-command-map (kbd "t o") 'pd/open-today-todo-file)
(define-key pd-command-map (kbd "n o") 'pd/open-notes-file)
(define-key pd-command-map (kbd "b d") 'kill-current-buffer)
(define-key pd-command-map (kbd "l b") 'list-bookmarks)
(define-key pd-command-map (kbd "U") 'xref-find-references)
(define-key pd-command-map (kbd "o t") 'pd/start-terminal-in-current-folder)
(define-key pd-command-map (kbd "w <left>") 'windmove-left)
(define-key pd-command-map (kbd "w <up>") 'windmove-up)
(define-key pd-command-map (kbd "w <right>") 'windmove-right)
(define-key pd-command-map (kbd "w <down>") 'windmove-down)
(define-key pd-command-map (kbd "1") 'proced)
(define-key pd-command-map (kbd "2") 'quick-calc)
(define-key pd-command-map (kbd "f +") 'pd/increase-font-size)
(define-key pd-command-map (kbd "f -") 'pd/decrease-font-size)
(define-key pd-command-map (kbd "\"") (lambda () (interactive) (pd/surround (region-beginning) (region-end) "\"" "")))
(define-key pd-command-map (kbd "(") (lambda () (interactive) (pd/surround (region-beginning) (region-end) "(" ")")))
(define-key pd-command-map (kbd "[") (lambda () (interactive) (pd/surround (region-beginning) (region-end) "[" "]")))
(define-key pd-command-map (kbd "{") (lambda () (interactive) (pd/surround (region-beginning) (region-end) "{" "}")))

;; Special config for org mode
(define-key org-mode-map (kbd "C-<f12>") 'org-toggle-todo-and-fold)

;; Remove annoying org-mode specific entry update key mappings
;; which disables selection with Shift-up/down in some cases.
;; (See: https://github.com/bzg/org-mode/blob/main/lisp/org-keys.el#L483-L484)
(define-key org-mode-map (kbd "S-<down>") nil)
(define-key org-mode-map (kbd "S-<up>") nil)
(define-key org-mode-map (kbd "C-S-<left>") nil)
(define-key org-mode-map (kbd "C-S-<right>") nil)

;; Keymap will be overwritten by org mode:
(define-key org-mode-map (kbd "C-<return>") 'pd-command-map)
;; TODO
;; (define-key org-mode-map (kbd "C-S-<down>") 'forward-paragraph)
;; (define-key org-mode-map (kbd "C-S-<up>") 'backward-paragraph)

;; C-d was overwritten in these mode maps - so re-enable it again
(defun my-c++-mode-hook ()
  (define-key c++-mode-map (kbd "C-d") 'mc/mark-next-like-this))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(defun my-c-mode-hook ()
  (define-key c-mode-map (kbd "C-d") 'mc/mark-next-like-this))
(add-hook 'c-mode-hook 'my-c-mode-hook)

;; Custom cider shortcuts
(add-hook 'clojure-mode-hook
          (lambda () (define-key clojure-mode-map (kbd "C-c r") 'cider-jack-in)
            (define-key clojure-mode-map (kbd "S-<f5>") 'cider-eval-last-sexp)))

;; Load emacs custom settings
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;; Needed for git root dir query (TODO Needed?)
(require 'vc)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(pd/setup-indent-level 2)

(which-key-mode)

;; No startup screen
(setq inhibit-startup-screen t)

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(blink-cursor-mode 0)

;; Highlight current line
(global-hl-line-mode 1)

(pd/theme)

;; Set initial window size
(if (window-system)
    (if (string= (getenv "PD_LAPTOP") "1")
        (add-to-list 'default-frame-alist '(fullscreen . maximized))
      (set-frame-size (selected-frame) 130 70)))
;;(when window-system (set-frame-size (selected-frame) 220 71))

;; Make syntax highlighting work in current line
(set-face-foreground 'highlight nil)

(setq-default line-spacing 0.0)

;; https://github.com/auto-complete/auto-complete/blob/master/doc/manual.md#not-to-complete-automatically
(setq ac-auto-start nil)
(ac-config-default)

(setq-default show-trailing-whitespace t)

(setq-default indicate-empty-lines t)

(setq-default indicate-buffer-boundaries 'left)

(setq sentence-end-double-space nil)

(smartparens-mode)

(back-button-mode 1)

;; Highlight TODOs etc.
(hl-todo-mode 1)

;; Enable narrow to region
(put 'narrow-to-region 'disabled nil)

;; Split window vertically on startup
;;(split-window-right)

;; e.g. for lsp
;; See: https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Smooth keyboard scrolling
;;(setq scroll-step 1) ;; keyboard scroll one line at a time

(add-hook 'after-init-hook 'global-company-mode)
