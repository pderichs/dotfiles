;; General key bindings
(global-set-key (kbd "C-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "s-q") 'save-buffers-kill-emacs)

;; Moving between windows
(global-set-key (kbd "M--") 'previous-multiframe-window)
(global-set-key (kbd "M-+") 'next-multiframe-window)

;; using helm-m-x instead of the default implementation
;(global-set-key (kbd "M-x") 'helm-M-x)

;; Using smex for command execution
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is the original M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Ace jump mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Fiplr to C-c p
;(global-set-key (kbd "C-c p") 'fiplr-find-file)

;; Major key binding (navigation, project management etc...)
(global-set-key (kbd "M-1") 'projectile-switch-project)
(global-set-key (kbd "M-2") 'helm-mini)
(global-set-key (kbd "M-3") 'helm-semantic-or-imenu)
(global-set-key (kbd "M-4") 'helm-projectile-switch-to-buffer)

(global-set-key (kbd "M-5") 'kmacro-start-macro)
(global-set-key (kbd "M-6") 'kmacro-end-macro)
(global-set-key (kbd "M-7") 'kmacro-end-and-call-macro)

(global-set-key (kbd "M-8") 'projectile-invalidate-cache)
(global-set-key (kbd "M-9") 'helm-projectile-grep)
(global-set-key (kbd "M-0") 'projectile-find-file)

(global-set-key (kbd "C-M-0") 'rspec-verify-all)

(global-set-key (kbd "C-7") 'mc/edit-lines)
(global-set-key (kbd "C-8") 'mc/mark-next-like-this)
(global-set-key (kbd "C-9") 'mc/mark-all-like-this)
