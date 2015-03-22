;; Thanks to justinhj (StackOverflow): http://stackoverflow.com/a/2035987
(defun open-in-browser()
  (interactive)
  (let ((filename (buffer-file-name)))
    (browse-url (concat "file://" filename))))
