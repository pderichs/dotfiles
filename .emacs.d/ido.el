;; Load extension "ido-mode"
(require 'ido)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

;; Make recent file list available to ido
(recentf-mode 1)
(setq ido-virtual-buffers t
      recentf-max-saved-items 1000)

;; activate Desktop mode to reopen recent files automatically
;(desktop-save-mode 1)
