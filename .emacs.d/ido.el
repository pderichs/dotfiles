;; Load extension "ido-mode"
(require 'ido)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode 1)

;; Enable flx ido mode (fuzzy matching)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Make recent file list available to ido
(recentf-mode 1)
(setq ido-virtual-buffers t
      recentf-max-saved-items 1000)

;; activate Desktop mode to reopen recent files automatically
;(desktop-save-mode 1)
