;; Additional custom functions for main configuration.

(require 'projectile)
(require 'rubocop)

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

(defun print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))

(defun pd/git-get-all-changed-files-current-branch (&optional current-folder)
  "Returns a list of all files changed within a branch"
  (split-string
   (let ((default-directory (or current-folder (projectile-project-root))))
      (shell-command-to-string "git whatchanged --name-only --pretty=\"\" origin..HEAD"))))

(defun pd/test-git-command ()
  "Just a test"
  (interactive)
  (print-elements-of-list (pd/git-get-all-changed-files-current-branch)))

(defun pd/run-rubocop-on-all-changed-files ()
  "Runs rubocop on all changed files"
  (interactive)
  (rubocop-ensure-installed)
  (let ((current-project-folder (projectile-project-root)))
    (if current-project-folder
        (let ((changed-files (pd/git-get-all-changed-files-current-branch current-project-folder)))
          (let ((cd-command (concat "cd " current-project-folder)))
            (let ((cop-command (concat "bundle exec rubocop --format emacs " (string-join changed-files " "))))
              (compilation-start (concat cd-command ";" cop-command))
              )
            )
          )
        (error "You're not into a project"))
    )
  )

(defun pd/run-rspec-on-all-changed-files ()
  "Runs rspec on all changed files"
  (interactive)
  (let ((current-project-folder (projectile-project-root)))
    (if current-project-folder
        (let ((changed-files (pd/git-get-all-changed-files-current-branch current-project-folder)))
          (let ((changed-spec-files (seq-filter (lambda (x) (string-match "^.*_spec.rb$" x)) changed-files)))
            (let ((cd-command (concat "cd " current-project-folder)))
              (let ((rspec-command (concat "bundle exec rspec " (string-join changed-spec-files " "))))
                (compilation-start (concat cd-command ";" rspec-command))
                )
              )
            )
          )
      (error "You're not into a project"))
    )
  )

(defun pd/run-rspec-on-current-file ()
  "Runs rspec on current file"
  (interactive)
  (let ((current-project-folder (projectile-project-root)))
    (if current-project-folder
        (let ((cd-command (concat "cd " current-project-folder)))
          (let ((rspec-command (concat "bundle exec rspec " (buffer-file-name))))
            (compilation-start (concat cd-command ";" rspec-command))
            )
          )
      (error "You're not into a project"))
    )
  )
