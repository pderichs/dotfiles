;; General key bindings
(global-set-key (kbd "s-h") 'helm-mini)

(global-set-key (kbd "C-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "s-q") 'save-buffers-kill-emacs)

;; Using helm-M-x instead of the default implementation
;(global-set-key (kbd "M-x") 'helm-M-x)

;; Using smex for command execution
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Fiplr to C-c p
;(global-set-key (kbd "C-c p") 'fiplr-find-file)

;; Projectile key bindings
;; (define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
;; (define-key projectile-mode-map [?\s-P] 'projectile-switch-project)
;; (define-key projectile-mode-map [?\s-f] 'projectile-find-file)
;; (define-key projectile-mode-map [?\s-g] 'projectile-grep)
(global-set-key (kbd "M-1") 'projectile-find-file)
(global-set-key (kbd "M-2") 'projectile-switch-project)
(global-set-key (kbd "M-8") 'projectile-grep)
(global-set-key (kbd "M-9") 'projectile-invalidate-cache)
