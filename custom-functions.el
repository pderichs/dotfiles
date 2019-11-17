;; Additional custom functions for main configuration.

;; Thanks to http://blog.binchen.org/posts/easy-indentation-setup-in-emacs-for-web-development.html
(defun pd/setup-indent-level (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun pd/open-today-todo-file ()
  "Open current todo file"
  (interactive)
  (find-file (concat  (getenv "TODO") "/" (format-time-string "%Y%m%d.org")))
  (org-mode))

(defun pd/window-sizes-setup (w h font-size)
  "Resizes the window and font size by the given parameters"
  (set-face-attribute 'default nil :height (* font-size 10))
  (set-frame-position (selected-frame) 10 10)
  (set-frame-size (selected-frame) w h t))

(defun pd/setup-default-frame-and-font-size ()
  "Uses default sizes for frame and font"
  (interactive)
  (pd/window-sizes-setup 2500 1500 11))

(defun pd/setup-laptop-frame-and-font-size ()
  "Uses default sizes for frame and font"
  (interactive)
  (pd/window-sizes-setup 2024 968 10))
