;;; init.el --- Where all the magic begins
;;
;; This is the first thing to get loaded.
;;

;; Enable smooth scrolling.
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; I want auto indentation.
(global-set-key "\C-m" 'newline-and-indent)

;; Tab size is 2.
(setq default-tab-width 2)

;; No tabs (we want spaces instead).
(setq-default indent-tabs-mode nil)

;; No auto-indentation
(setq electric-indent-mode nil)

;; No line wrap.
;(setq-default truncate-lines 1)

;; No menu bar.
;;(menu-bar-mode -1)

;; No toolbar.
(tool-bar-mode -1)

;; Enhance font-size for graphical emacs.
(set-face-attribute 'default nil :height 150)

;; Color Theme.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable ruby-electric when entering ruby mode
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

;; Enable multiple-cursors keys
(global-set-key (kbd "C-M-m") 'mc/mark-next-like-this)
;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Line numbers on
(line-number-mode 1)

;; Columns on
(column-number-mode 1)

;; Line numbers to the left
;;(global-linum-mode t)

;; Enable Shift+Cursortasten - hier gibt es einen Konflikt mit org-mode.
;; (siehe: http://www.emacswiki.org/emacs/OrgMode - Abschnitt "Conflicts")
;(setq org-replace-disputed-keys t)

;; Enable cua-mode by default
;; (cua-mode t)
;; (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;; (transient-mark-mode 1) ;; No region when it is not highlighted
;; (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; Load extension "ido-mode"
(require 'ido)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

;; Remove trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Show matching brackets
(show-paren-mode 1)

;; For graphical emacs: bigger font
;;(set-face-attribute 'default nil :height 180)

;; For graphical emacs: no toolbar
;;(tool-bar-mode -1)

;; Insert tabs in every mode
;;(global-set-key (kbd "TAB") 'self-insert-command)

;; Ruby mode for following files
;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; Enable meta key of mac for brackets
;;(setq default-input-method "MacOSX")
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;; Set the correct environment for bash commands
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; Selection should be deleted when typing
(delete-selection-mode 1)

;; Highlight entire bracket content when cursor is inside
;(setq show-paren-style 'expression)

;; MELPA and Marmalade package repositories
(require 'package)
(add-to-list 'package-archives
                 '("marmalade" .
                         "http://marmalade-repo.org/packages/"))
;; --- problem: projectile was not able to be installed when that was activated:
;;(add-to-list 'package-archives
;;               '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Helm to C-c h
(global-set-key (kbd "s-h") 'helm-mini)

;; Fiplr to C-c p
;(global-set-key (kbd "C-c p") 'fiplr-find-file)

;; activate Desktop mode to reopen recent files automatically
;(desktop-save-mode 1)

;; Make recent file list available to ido
(recentf-mode 1)
(setq ido-virtual-buffers t
      recentf-max-saved-items 1000)

;; All files should be reloaded when the content change on disk.
(global-auto-revert-mode t)

;; These files are HTML
(add-to-list 'auto-mode-alist '("\\.jst.eco$" . html-mode))

;; C++ Style
(setq-default c-basic-offset 2 c-default-style "linux")

;; Projectile
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)
;;(setq projectile-completion-system 'grizzl)

;; Projectile key bindings
(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-P] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
(define-key projectile-mode-map [?\s-g] 'projectile-grep)

;; Highlight lines with more than 80 chars
(add-hook 'ruby-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-red-b)))


;; Function to jump to a symbol (using imenu and ido)
;; for details:
;; http://chopmo.blogspot.de/2008/09/quickly-jumping-to-symbols.html

(defun ido-goto-symbol ()
  "Will update the imenu index and then use ido to select a
   symbol to navigate to"
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (cl-flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(global-set-key (kbd "C-t") 'ido-goto-symbol)
