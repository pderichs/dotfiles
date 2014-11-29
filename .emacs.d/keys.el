;; General key bindings
(global-set-key (kbd "s-h") 'helm-mini)

(global-set-key (kbd "C-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "s-q") 'save-buffers-kill-emacs)

;; Moving between windows
(global-set-key (kbd "M--") 'previous-multiframe-window)
(global-set-key (kbd "M-+") 'next-multiframe-window)


;; Using helm-M-x instead of the default implementation
;(global-set-key (kbd "M-x") 'helm-M-x)

;; Using smex for command execution
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Ace jump mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Fiplr to C-c p
;(global-set-key (kbd "C-c p") 'fiplr-find-file)

;; Projectile key bindings
(global-set-key (kbd "M-1") 'projectile-switch-project)
(global-set-key (kbd "M-4") 'helm-projectile-switch-to-buffer)
(global-set-key (kbd "M-8") 'projectile-invalidate-cache)
(global-set-key (kbd "M-9") 'helm-projectile-ag)
(global-set-key (kbd "M-0") 'projectile-find-file)
