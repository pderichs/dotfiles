;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; This file sets the environment specific variables
;;   - user-full-name
;;   - user-mail-address
;;   - user-personal-data-folder
;;   - user-personal-documents-folder
;;   - user-personal-notes-folder
;;   - user-personal-zettelkasten-folder
;;
;; You can find a template for the required variables in
;; user-env.el.template.
(load! "user-env.el")

;; GPG related configuration
(load! "gpg.el")

(load! "functions.el")

(load! "ui.el")

;; Make evil undo more feingranular.
(setq evil-want-fine-undo t)

;; Increase company idle delay to make it less annoying
;; C-SPC is bound to manually trigger company completion menu.
;; (custom-set-variables
;;  '(company-idle-delay 2))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; All org files should be opened folded
(setq org-startup-folded t)

;; Make avy work across all visible windows
(setq avy-all-windows t)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Configure fortune (https://www.emacswiki.org/emacs/Fortune)
(setq fortune-dir "/usr/share/games/fortunes")
(setq fortune-file "/usr/share/games/fortunes")
(setq fortune-program "/usr/games/fortune")

;; Increase kill ring max
(setq kill-ring-max 100)

(load! "dashboard.el")

(load! "keys.el")

;; ----------------------------------------------------------------------------------------------------
;; General settings
;; ----------------------------------------------------------------------------------------------------
;; Check / Create todays todo file on startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (let ((today-todo-file (format-time-string "%Y%m%d.org.gpg")))
              (if (string= (system-name) "vault")
                  (pd/create-todays-todo-file today-todo-file)))))

;; Special settings for C/C++
(add-hook 'c-mode-hook 'pd/setup-c-cpp-mode)
(add-hook 'cpp-mode-hook 'pd/setup-c-cpp-mode)

;; Set docsets according to file type
(add-hook 'c-mode-hook
          (lambda () (setq zeal-at-point-docset '("c" "cpp"))))
(add-hook 'cpp-mode-hook
          (lambda () (setq zeal-at-point-docset '("c" "cpp"))))
(add-hook 'html-mode-hook
          (lambda () (setq zeal-at-point-docset "html")))
(add-hook 'css-mode-hook
          (lambda () (setq zeal-at-point-docset "css")))
(add-hook 'rust-mode-hook
          (lambda () (setq zeal-at-point-docset "rust")))
(add-hook 'go-mode-hook
          (lambda () (setq zeal-at-point-docset "go")))
;; TODO Add more

;; Enable back button mode
(back-button-mode 1)

;; Default indent level to 2
(pd/setup-indent-level 2)

;; Emacs should respect editorconfig
(editorconfig-mode 1)

(load! "nim.el")
(load! "go.el")

(load! "debug.el")

(load! "eradio.el")

(pd/create-todays-todo-file (pd/todo-file-name))

(nyan-mode)
