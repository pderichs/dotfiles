;; General key bindings
(global-set-key (kbd "M-q") 'save-buffers-kill-emacs)

;; Moving between windows
(global-set-key (kbd "M--") 'previous-multiframe-window)

;; Use helm-M-x
(global-set-key (kbd "M-x") 'helm-M-x)
;; using helm-m-x instead of the default implementation
;(global-set-key (kbd "M-x") 'helm-M-x)

;; Ace jump mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Major key binding (navigation, project management etc...)
(global-set-key (kbd "M-1") 'projectile-switch-project)
(global-set-key (kbd "M-2") 'helm-mini)
(global-set-key (kbd "M-4") 'helm-projectile-switch-to-buffer)

(global-set-key (kbd "M-5") 'kmacro-start-macro)
(global-set-key (kbd "M-6") 'kmacro-end-macro)
(global-set-key (kbd "M-7") 'kmacro-end-and-call-macro)

(global-set-key (kbd "M-8") 'projectile-invalidate-cache)

(global-set-key (kbd "C-F") 'helm-projectile-ag)

(global-set-key (kbd "M-p") 'projectile-find-file)

(global-set-key (kbd "C-M-0") 'rspec-verify-all)

(global-set-key (kbd "C-7") 'mc/edit-lines)
(global-set-key (kbd "C-8") 'mc/mark-next-like-this)
(global-set-key (kbd "C-9") 'mc/mark-all-like-this)

;; Sublime like key settings
(global-set-key (kbd "M-o")   'ido-find-file)
(global-set-key (kbd "M-d")   'mc/mark-next-like-this)
(global-set-key (kbd "C-M-g") 'mc/mark-all-like-this)
(global-set-key (kbd "M-s")   'save-buffer)
(global-set-key (kbd "M-L")   'mc/edit-lines)
(global-set-key (kbd "M-p")   'projectile-find-file)
(global-set-key (kbd "M-r")   'helm-semantic-or-imenu)

;; Enable robe jump
(global-set-key (kbd "M-g") 'robe-jump)

(global-set-key (kbd "C-c C-c") 'comment-region)

;; Easy buffer switch
(global-set-key (kbd "C-b") 'projectile-switch-to-buffer)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "M-,") 'magit-status)

(global-set-key (kbd "M-g") 'goto-line)
