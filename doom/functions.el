;; ----------------------------------------------------------------------------------------------------
;; Custom tool functions
;; ----------------------------------------------------------------------------------------------------

;; Thanks to https://web.cs.elte.hu/local/texinfo/elisp-intro/emacs-lisp-intro_132.html
(defun debug-print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))

;; Thanks to https://www.emacswiki.org/emacs/SetFonts
(defun font-existsp (font)
  "Checks whether the given font exists"
  (if (null (x-list-fonts font))
      nil t))

;; Thanks to http://blog.binchen.org/posts/easy-indentation-setup-in-emacs-for-web-development.html
(defun pd/setup-indent-level (n)
  "Sets the indent level for multiple languages to n."
  (setq c-basic-offset n) ;; java + c/c++
  (setq coffee-tab-width n)
  (setq javascript-indent-level n)
  (setq js-indent-level n)
  (setq js2-basic-offset n)
  (setq web-mode-markup-indent-offset n)
  (setq web-mode-css-indent-offset n)
  (setq web-mode-code-indent-offset n)
  (setq css-indent-offset n))

(defun pd/todo-file-name ()
  "Returns the name of today's todo file"
  (format-time-string "%Y%m%d.org.gpg"))

(defun pd/insert-gpl-header ()
  "Inserts a file header in a C/C++ comment at the current cursor position"
  (interactive)
  (insert "/**")
  (newline)
  (insert " * <one line to give the program's name and a brief idea of what it does.>")
  (newline)
  (insert " * Copyright (C) " (format-time-string "%Y") "  pderichs (derichs@posteo.de)")
  (newline)
  (insert " *")
  (newline)
  (insert " * This program is free software: you can redistribute it and/or modify")
  (newline)
  (insert " * it under the terms of the GNU General Public License as published by")
  (newline)
  (insert " * the Free Software Foundation, either version 3 of the License, or")
  (newline)
  (insert " * (at your option) any later version.")
  (newline)
  (insert " *")
  (newline)
  (insert " * This program is distributed in the hope that it will be useful,")
  (newline)
  (insert " * but WITHOUT ANY WARRANTY; without even the implied warranty of")
  (newline)
  (insert " * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the")
  (newline)
  (insert " * GNU General Public License for more details.")
  (newline)
  (insert " *")
  (newline)
  (insert " * You should have received a copy of the GNU General Public License")
  (newline)
  (insert " * along with this program.  If not, see <https://www.gnu.org/licenses/>.")
  (newline)
  (insert "*/")
  (newline)
  (newline))

(defun pd/open-today-todo-file ()
  "Open todo file for today"
  (interactive)
  (find-file (concat  (getenv "TODO") "/" (pd/todo-file-name)))
  (org-mode))

(defun pd/open-notes-file ()
  "Open todo file for today"
  (interactive)
  (find-file (concat user-personal-notes-folder "/notizen.org.gpg"))
  (org-mode))

(defun pd/start-terminal-in-current-folder ()
  "Starts a terminal in the current file's folder."
  (interactive)
  (setq default-directory (file-name-directory buffer-file-name))
  (start-process (getenv "TERMINAL") nil (getenv "TERMINAL")))

(defun pd/create-todays-todo-file (todo-file-name)
  "Checks / create todo file for today"
  (let ((today-todo-file-path (concat  (getenv "TODO") "/" todo-file-name)))
    (if (not (file-exists-p today-todo-file-path))
        (let ((existing-todo-files (directory-files (getenv "TODO") nil "\.org.gpg$" nil)))
          (if existing-todo-files
              (copy-file (concat (getenv "TODO") "/" (car (last existing-todo-files))) today-todo-file-path))))))

(defun pd/search-string-in-folder ()
  "Searches for a string in a specific folder."
  (interactive)
  (let ((folder-to-search-in (read-directory-name "Search for string in Directory:")))
    (unless (string= "" folder-to-search-in)
      (consult-ripgrep folder-to-search-in))))

(defun pd/search-file-in-folder ()
  "Searches for a string in a specific folder."
  (interactive)
  (let ((folder-to-search-in (read-directory-name "Search for a file in Directory:")))
    (unless (string= "" folder-to-search-in)
      (consult-find folder-to-search-in))))

;; Thanks to https://stackoverflow.com/a/16127347
(defun pd/my-root-dir ()
  "Retrieves the source control root dir of the current file."
  (let ((path (file-name-directory buffer-file-name)))
    (vc-call-backend (vc-responsible-backend path) 'root path)))

(defun pd/compile-in-folder (x-compile-command)
  "Runs make within a specific folder."
  (interactive)
  (let ((execution-folder (read-directory-name "Directory:")))
    (unless (string= "" execution-folder)
      (progn
        (setq default-directory execution-folder)
        (compile x-compile-command)))))

(defun pd/compile-from-vc-root-folder (x-compile-command)
  "Runs compile within the vc root folder."
  (interactive)
  (let ((root-dir (pd/my-root-dir)))
    (if (eq root-dir nil)
        (message "*** Root dir is nil! Aborting.")
      (progn
        (setq default-directory root-dir)
        (compile x-compile-command)))))

(defun pd/cpp-insert-header-guard ()
  "Inserts a header guard"
  (interactive)
  (let ((name (subst-char-in-string ?\  ?_ (upcase (read-string "Guard identifier: ")))))
    (insert "#ifndef " name "_INCLUDED")
    (newline)
    (insert "#define " name "_INCLUDED")
    (newline)
    (newline)
    (insert "#endif")
    (previous-line)))

(defun pd/cpp-insert-cout ()
  "Inserts a std::cout output"
  (interactive)
  (insert "std::cout << << std::endl;")
  (newline)
  (previous-line)
  (evil-first-non-blank-of-visual-line)
  (forward-evil-word 4))

(defun pd/cpp-include-file-candidates (dir)
  "Returns a list which combines default and local include files"
  (let* ((system-includes
          '(
            ("vector" . t)
            ("any" . t)
            ("list" . t)
            ("deque" . t)
            ("limits" . t)
            ("iostream" . t)
            ("fstream" . t)
            ("sstream" . t)
            ("set" . t)
            ("map" . t)
            ("functional" . t)
            ("tuple" . t)
            ("memory" . t)
            ("string" . t)
            ("optional" . t)
            ("queue" . t)
            ("ostream" . t)
            ("chrono" . t)
            ("iterator" . t)
            ("stdexcept" . t)
            ("regex" . t)
            ("cstdlib" . t)
            ("algorithm" . t)
            ("cmath" . t)
            ("math.h" . t)
            ("stdio.h" . t)
            ("string.h" . t)
            ("stdlib.h" . t)
            ("memory.h" . t)
            ("malloc.h" . t)
            ))
         (local-header-files
          (f-files dir
                   (lambda (file) (string= (f-ext file) "h"))
                   t)
          )
         (all-includes (copy-alist system-includes)) ;; will be the result later
         )

    (dolist (file-entry local-header-files)
      (let* ((base-file-name (f-filename file-entry)))
        (push (list base-file-name . nil) all-includes)
        )
      )
    all-includes))

(defun pd/cpp-insert-include ()
  "Inserts include statement"
  (interactive)
  (let* ((possible-include-files-with-sys-flag (pd/cpp-include-file-candidates default-directory))
         (user-input (completing-read "Include file name: " possible-include-files-with-sys-flag nil nil))
         (include-file-name (list user-input (alist-get user-input possible-include-files-with-sys-flag nil nil 'string-equal)))
         (is-system-include (cadr include-file-name))
         (surrounding (if is-system-include '("<" ">") '("\"" "\""))))
    (insert "#include " (car surrounding) (car include-file-name) (car (cdr surrounding)))
    (newline)))

(defun pd/cpp-open-corresponding-file ()
  "Switch between header and source"
  (interactive)
  (let* ((other-file-name (if (string= (f-ext buffer-file-name) "h") (s-replace ".h" ".cpp" buffer-file-name)
                            (s-replace ".cpp" ".h" buffer-file-name))))
    (if (f-exists? other-file-name)
        (find-file other-file-name)
      (message (concat "File does not exist: " other-file-name)))))

(defun pd/insert-date ()
  "Inserts the current date"
  (interactive)
  (insert (format-time-string "%Y.%m.%d"))
  (newline))

(defun pd/insert-line ()
  "Inserts a line"
  (interactive)
  (insert (make-string 60 ?-))
  (newline))

(defun pd/lookup-definition-and-center-cursor ()
  "Calls lookup logic and centers the cursor afterwards"
  (interactive)
  (+lookup/definition (thing-at-point 'word 'no-properties))
  (call-interactively (key-binding (kbd "zz"))))

(defun pd/lookup-references ()
  "Calls lookup logic and centers the cursor afterwards"
  (interactive)
  (+lookup/references (thing-at-point 'symbol 'no-properties)))

(defun pd/setup-c-cpp-mode ()
  "Special setup for C/C++"
  ;; lsp-clangd-find-other-file is better in C/C++ to switch between
  ;; source / header.
  (map! :leader :desc "Find other file" "of" #'lsp-clangd-find-other-file))

;; TODO
;; (defun pd/git-grep-find-string-in-all-commit-content ()
;;   "Executes git grep to find string in all available git commits"
;;   ;; Relevant git command:
;;   ;; git grep <regexp> $(git rev-list --all)
;;   (interactive)
;;   (let ((user-input-regex (read-regexp "Regexp to search for: ")))
;; ;; Helpful? https://github.com/ghosty141/consult-git-log-grep/blob/master/consult-git-log-grep.el
;;     ))
