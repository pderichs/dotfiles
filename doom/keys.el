;; ----------------------------------------------------------------------------------------------------
;; Keys
;; ----------------------------------------------------------------------------------------------------

;; --- leader keys
(map! :leader :desc "Split window vertically" "w/" #'split-window-horizontally)
(map! :leader :desc "Split window vertically" "w-" #'split-window-vertically)
(map! :leader :desc "Select rest of line" "," (edmacro-parse-keys "v$h" t))
(map! :leader :desc "Open terminal in current folder" "ot" #'pd/start-terminal-in-current-folder) ;; "open terminal"
(map! :leader :desc "Open todo file of today" "to" #'pd/open-today-todo-file)
(map! :leader :desc "Open file in project" "pf" #'projectile-find-file)
(map! :leader :desc "Open notes file" "no" #'pd/open-notes-file)
(map! :leader :desc "Open bookmark list for editing" "lb" #'list-bookmarks)
(map! :leader :desc "M-x" "SPC" #'execute-extended-command)
(map! :leader :desc "List functions / symbols of current file" "ji" #'consult-imenu)
(map! :leader :desc "Show Register / Clipboard contents" "-" #'consult-register) ;; also see binding for "pl"
(map! :leader :desc "Find other file" "of" #'pd/cpp-open-corresponding-file)
(map! :leader :desc "Create a new buffer" "bn" #'evil-buffer-new) ;; normally bound to next-buffer
(map! :leader :desc "Select item from kill buffer to paste" "pl" #'consult-yank-from-kill-ring) ;; "paste from list"
(map! :leader :desc "Search for a string in a specific folder" "[" #'pd/search-string-in-folder)
(map! :leader :desc "Search for a string in a specific folder" "ö" #'pd/search-string-in-folder)
(map! :leader :desc "Search for a file in a specific folder" "]" #'pd/search-file-in-folder)
(map! :leader :desc "Search for a file in a specific folder" "ä" #'pd/search-file-in-folder)
(map! :leader :desc "Delete current buffer" "kk" #'kill-current-buffer)
(map! :leader :desc "Compiles current project by calling make in root folder" "cc" (lambda () (interactive) (pd/compile-from-vc-root-folder "make -k")))
(map! :leader :desc "Calling run make target in vc root folder" "cr" (lambda () (interactive) (pd/compile-from-vc-root-folder "make run")))
(map! :leader :desc "Calling debug make target in vc root folder" "cg" (lambda () (interactive) (pd/compile-from-vc-root-folder "make debug")))
(map! :leader :desc "Calling unittests make target in vc root folder" "cu" (lambda () (interactive) (pd/compile-from-vc-root-folder "make unittests")))
(map! :leader :desc "Executing make and build make targets in vc root folder" "ca" (lambda () (interactive) (pd/compile-from-vc-root-folder "make clean && make -k -j 7")))
;;(map! :leader :desc "Compiles current project by calling make in root folder" "cc" #'compile) ;; old version - does not work all the time
(map! :leader :desc "Mark whole buffer" "hh" #'mark-whole-buffer)
;;(map! :leader :desc "Compile project" "cc" #'+make/run)
;;(map! :leader :desc "Compile project" "cc" #'compile)
(map! :leader :desc "Compile project" "cc" (lambda () (interactive) (pd/compile-from-vc-root-folder "make -k")))
(map! :leader :desc "Jumps to the last change" "lc" #'goto-last-change)
;;(map! :leader :desc "Formats the whole file" "cf" (edmacro-parse-keys "ggVG=``" t))
(map! :leader :desc "Formats the whole file" "cf" #'lsp-format-buffer)
(map! :leader :desc "Inserts the current date" "id" #'pd/insert-date)
(map! :leader :desc "Inserts the current date" "il" #'pd/insert-line)
(map! :leader :desc "Jump to workspace symbol" "jj" #'consult-lsp-symbols)
(map! :leader :desc "Jump to workspace symbol" "jd" #'consult-lsp-diagnostics)
(map! :leader :desc "Open Zettelkasten search" "ze" (lambda () (interactive) (consult-ripgrep (concat user-personal-zettelkasten-folder))))
(map! :leader :desc "Open current folder in file manager" "cd" (lambda () (interactive) (call-process "xdg-open" nil 0 nil ".")))
(map! :leader :desc "Search for definition in another window" "gow" #'xref-find-definitions-other-window)
(map! :leader :desc "Toggle neotree" "nt" #'neotree-toggle)

;; Switch view of workspace buffers with all buffers
(map! :leader :desc "Quick jump to all buffers" "bb" #'consult-buffer)
(map! :leader :desc "Switch to workspace buffer" "bB" #'+vertico/switch-workspace-buffer)

;; Mark multiple occurrences
(map! :leader :desc "Mark this and next occurrence" "mn" #'evil-multiedit-match-and-next) ;; or M-d / M-D
(map! :leader :desc "Mark this and all other occurrences" "ma" #'evil-multiedit-match-all)

;; eradio
(map! :leader (:prefix ("r" . "eradio") :desc "Play a radio channel" "p" 'eradio-play))
(map! :leader (:prefix ("r" . "eradio") :desc "Stop the radio player" "s" 'eradio-stop))
(map! :leader (:prefix ("r" . "eradio") :desc "Toggle the radio player" "t" 'eradio-toggle))

;; --- non leader keys
;; (define-key evil-normal-state-map "gb" #'xref-pop-marker-stack)
(define-key evil-normal-state-map "gb" #'back-button-global-backward)
;; (define-key evil-normal-state-map "gf" #'xref-go-forward)
(define-key evil-normal-state-map "gf" #'back-button-global-forward)
(define-key evil-normal-state-map "gi" #'xref-find-definitions)
;; (define-key evil-normal-state-map "U" #'xref-find-references)
(define-key evil-normal-state-map "U" #'pd/lookup-references)
(define-key evil-visual-state-map "U" #'pd/lookup-references) ;; overrides uppercase
(define-key evil-normal-state-map (kbd "<f9>") #'consult-recent-file)
(define-key evil-normal-state-map (kbd "<f10>") #'pd/open-today-todo-file)
(define-key evil-normal-state-map (kbd "<f11>") #'consult-bookmark)
(define-key evil-normal-state-map (kbd "C-j") #'evil-forward-paragraph)
(define-key evil-normal-state-map (kbd "C-k") #'evil-backward-paragraph)
(define-key evil-normal-state-map (kbd "C-<SPC>") #'+company/complete)
(define-key evil-normal-state-map "gd" #'pd/lookup-definition-and-center-cursor)
(define-key evil-normal-state-map "L" (lambda () (interactive) (message "nop")))
(define-key evil-normal-state-map "M" #'er/expand-region) ;; overrides evil-window-middle
(define-key evil-normal-state-map "\\" (lambda () (interactive) (evil-visual-line)))
(define-key evil-normal-state-map "-" (lambda () (interactive) (evil-visual-line))) ;; overwrites evil prev line first non blank

;; Make normal emacs copy / paste work (allows for multiple copy / paste more easily)
(define-key evil-normal-state-map (kbd "C-y") #'yank)
(define-key evil-normal-state-map (kbd "C-w") #'kill-region)
(define-key evil-normal-state-map (kbd "M-w") #'kill-ring-save)

(define-key evil-normal-state-map (kbd "M-n") #'next-error)
(define-key evil-normal-state-map (kbd "M-p") #'previous-error)


;; org-mode: Shift-up should move to parent item
(add-hook 'org-mode-hook
          (lambda ()
            (define-key! org-mode-map "S-<up>" #'outline-up-heading))) ;; replaces org-shiftup

;; ----------------------------------------------------------------------------------------------------
;; LSP Configuration (hook)
;; ----------------------------------------------------------------------------------------------------
;; ;; Tried these, but the already established configurations seem to work better in my use cases
;; ;; for now.
;; (add-hook 'lsp-after-initialize-hook
;;           (lambda ()
;;             (define-key evil-normal-state-map "gd" #'lsp-find-definition)
;;             (define-key evil-normal-state-map "U" #'lsp-find-references)
;;             ))
