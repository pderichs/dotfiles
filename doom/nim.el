;; ----------------------------------------------------------------------------------------------------
;; Nim Mode Configuration
;; ----------------------------------------------------------------------------------------------------
;; Source: https://github.com/nim-lang/nim-mode

;; The `nimsuggest-path' will be set to the value of
;; (executable-find "nimsuggest"), automatically.
(setq nimsuggest-path (concat (getenv "HOME") ".asdf/shims/nimsuggest"))

(defun my--init-nim-mode ()
  "Local init function for `nim-mode'."

  ;; Just an example, by default these functions are
  ;; already mapped to "C-c <" and "C-c >".
  ;; (local-set-key (kbd "M->") 'nim-indent-shift-right)
  ;; (local-set-key (kbd "M-<") 'nim-indent-shift-left)

  ;; Make files in the nimble folder read only by default.
  ;; This can prevent to edit them by accident.
  (when (string-match "/\.nimble/" (or (buffer-file-name) "")) (read-only-mode 1))

  ;; If you want to experiment, you can enable the following modes by
  ;; uncommenting their line.
  ;; (nimsuggest-mode 1)
  ;; Remember: Only enable either `flycheck-mode' or `flymake-mode' at the same time.
  ;; (flycheck-mode 1)
  ;; (flymake-mode 1)

  ;; The following modes are disabled for Nim files just for the case
  ;; that they are enabled globally.
  ;; Anything that is based on smie can cause problems.
  (auto-fill-mode 0)
  (electric-indent-local-mode 0)
  )

;; Make imenu work for nim
(setq nim-imenu-functions
      '(
        ("Procedures" "\\(^proc.*\\)" 1)
        ("Functions" "\\(^func.*\\)" 1)
        ("Objects" "\\(^.*= ref object.*\\)" 1)
        ("Enums" "\\(^.*= enum.*\\)" 1)
        ))
(add-hook 'nim-mode-hook (lambda()
                           (my--init-nim-mode)
                           (setq imenu-generic-expression nim-imenu-functions)))
