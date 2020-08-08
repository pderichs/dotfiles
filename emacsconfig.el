;; Emacs Config 2020.1
;;
;; To use it, simply add these lines to init.el:
;;   (setq custom-file "~/dotfiles/emacsconfig.el")
;;        (load custom-file)

;; Needed by Package.el.
(package-initialize)

;; To install needed packages in a clean emacs:
;;   - package-refresh-contents
;;   - package-install-selected-packages
(setq package-selected-packages '(magit swiper swiper-helm helm helm-rg iedit dumb-jump))

;; Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Helm config
(require 'helm-config)

(setq helm-split-window-in-side-p           t 
      helm-move-to-line-cycle-in-source     t 
      helm-ff-search-library-in-sexp        t 
      helm-scroll-amount                    8 
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line        t)

(helm-mode 1)

;; Toolbar off
(tool-bar-mode -1)

;; Menu bar off
(menu-bar-mode -1)

;; Line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Symlinks
(setq vc-follow-symlinks nil)

;; Keys
;;

;; - Ctrl+C
(global-set-key (kbd "C-c") 'kill-ring-save) 
;; - Ctrl+X
(global-set-key (kbd "C-w") 'kill-region) 
;; - Ctrl+Y
(global-set-key (kbd "C-p") 'yank)
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
;; M-x
(global-set-key (kbd "<f5>") 'helm-M-x)
;; Search in current folder
(global-set-key (kbd "<f3>") 'helm-rg)
;; Find files
(global-set-key (kbd "C-#") 'helm-find)
;; Bookmark support
(global-set-key (kbd "<f12>") 'helm-bookmarks)
(global-set-key (kbd "<f11>") 'helm-buffers-list)
(global-set-key (kbd "<f9>") 'helm-recentf)
;; Magit
(global-set-key (kbd "<f8>") 'magit)
;; Find definition(s)
(global-set-key (kbd "<f12>") 'dumb-jump-go)

;; TODO: Split window?
;; TODO: Other window?
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit swiper swiper-helm helm helm-rg iedit dumb-jump))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
