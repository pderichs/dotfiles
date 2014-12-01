;; Setting PATH

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(when (eq system-type "gnu/linux")
  (setq home (getenv "HOME"))
  (setq paths
        (list
          (concat home "/go/bin")
          (concat home "/.rbenv/shims")
          (concat home "/rbenv/bin")
          "/usr/local/bin"
          "/usr/bin"
          "/bin"
          "/usr/sbin"
          "/sbin"
           (getenv "PATH")
          ))
  (setenv "PATH"
          (mapconcat 'identity
           paths ":")))

;; windows-nt...
