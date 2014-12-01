;; No menu bar.
;;(menu-bar-mode -1)

;; No toolbar.
(tool-bar-mode -1)

;; Load wombat theme
(load-theme 'wombat)

;; Highlight current line
;(global-hl-line-mode 1)
;(set-face-background 'hl-line "#223")

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

;; Line numbers on
(line-number-mode 1)

;; Columns on
(column-number-mode 1)

;; Enable multiple-cursors keys
(global-set-key (kbd "C-M-m") 'mc/mark-next-like-this)
;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; For graphical emacs: bigger font
;;(set-face-attribute 'default nil :height 180)

;; Suppress emacs startup screen
(setq inhibit-startup-message t)
