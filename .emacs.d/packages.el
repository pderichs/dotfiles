;; Set the correct environment for bash commands
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")


;; MELPA and Marmalade package repositories
(require 'package)
(add-to-list 'package-archives
                 '("marmalade" .
                         "http://marmalade-repo.org/packages/"))
;; --- problem: projectile was not able to be installed when that was activated:
(add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
