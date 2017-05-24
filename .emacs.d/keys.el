;; Set meta key according to environment
(if (string= (getenv "ENV_CMD_META") "1")
    (defun env-meta () "s")
  (defun env-meta () "M"))

;; General key bindings
(global-set-key (kbd (concat (env-meta) "-q")) 'save-buffers-kill-emacs)

;; Moving between windows
(global-set-key (kbd (concat (env-meta) "--")) 'previous-multiframe-window)
(global-set-key (kbd "C-o") 'previous-multiframe-window)

;; Use helm-M-x
(global-set-key (kbd (concat (env-meta) "-x")) 'helm-M-x)
;; using helm-m-x instead of the default implementation
;(global-set-key (kbd (concat (env-meta) "-x")) 'helm-M-x)

;; Ace jump mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Major key binding (navigation, project management etc...)
(global-set-key (kbd (concat (env-meta) "-1")) 'projectile-switch-project)
(global-set-key (kbd (concat (env-meta) "-2")) 'helm-mini)
(global-set-key (kbd (concat (env-meta) "-4")) 'helm-projectile-switch-to-buffer)

(global-set-key (kbd (concat (env-meta) "-5")) 'kmacro-start-macro)
(global-set-key (kbd (concat (env-meta) "-6")) 'kmacro-end-macro)
(global-set-key (kbd (concat (env-meta) "-7")) 'kmacro-end-and-call-macro)

(global-set-key (kbd (concat (env-meta) "-8")) 'projectile-invalidate-cache)

;; Search
(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(global-set-key (kbd "C-F") 'helm-projectile-ag)

(global-set-key (kbd (concat (env-meta) "-p")) 'projectile-find-file)

(global-set-key (kbd "C-7") 'mc/edit-lines)
(global-set-key (kbd "C-8") 'mc/mark-next-like-this)
(global-set-key (kbd "C-9") 'mc/mark-all-like-this)

(global-set-key (kbd (concat (env-meta) "-o"))   'ido-find-file)
(global-set-key (kbd (concat (env-meta) "-ö"))   'ido-find-file)

;; Sublime like settings
(global-set-key (kbd (concat (env-meta) "-d"))   'mc/mark-next-like-this)
(global-set-key (kbd "C-M-g") 'mc/mark-all-like-this)
(global-set-key (kbd (concat (env-meta) "-s"))   'save-buffer)
(global-set-key (kbd (concat (env-meta) "-L"))   'mc/edit-lines)
(global-set-key (kbd (concat (env-meta) "-p"))   'projectile-find-file)
(global-set-key (kbd (concat (env-meta) "-r"))   'helm-semantic-or-imenu)

(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-u") 'uncomment-region)

;; Easy buffer switch
(global-set-key (kbd "C-b") 'projectile-switch-to-buffer)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd (concat (env-meta) "-,")) 'magit-status)

(global-set-key (kbd "M-g") 'goto-line)
