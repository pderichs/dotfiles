;; ----------------------------------------------------------------------------------------------------
;; Custom banner image
;; ----------------------------------------------------------------------------------------------------

;; Thanks to https://zzamboni.org/post/my-doom-emacs-configuration-with-commentary/
(setq +doom-dashboard-menu-sections (cl-subseq +doom-dashboard-menu-sections 0 2))

(setq fancy-splash-image (concat doom-private-dir "splash/emacs-e-logo.png"))

;; Display a fortune message in emacs startup screen
(when (executable-find "fortune")
  (add-hook! '+doom-dashboard-functions :append
    (insert "\n" (+doom-dashboard--center +doom-dashboard--width
                                          (shell-command-to-string "fortune -a")))))
