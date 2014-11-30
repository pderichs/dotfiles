;; Setting PATH
(defvar home (getenv "HOME"))
(setenv "PATH"
  (concat
   home "/go/bin" ":"
   home "/.rbenv/shims" ":"
   home "/rbenv/bin" ":"
   "/usr/local/bin" ":"
   "/usr/bin" ":"
   "/bin" ":"
   "/usr/sbin:/sbin" ":"
   (getenv "PATH")
  )
)
