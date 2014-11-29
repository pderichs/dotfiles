;; Set the correct environment for bash commands
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; Repositories to be used
(require 'package)
(add-to-list 'package-archives
                 '("marmalade" .
                         "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Install required packages
(defvar required-packages
  '(
    magit
    yasnippet
    projectile
    ruby-end
    coffee-mode
    helm
    flx-ido
    smex
    grizzl
    go-mode
    helm-projectile
    helm-ag
    ) "a list of packages to ensure are installed at launch.")

(require 'cl)

; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
