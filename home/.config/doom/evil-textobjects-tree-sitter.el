;;; evil-textobjects-tree-sitter.el --- Tree-sitter Textobjekte für evil  -*- lexical-binding: t; -*-

;; Drop-in für Doom Emacs. Lädt nach evil und richtet syntaxbasierte
;; Textobjekte sowie Sprung-Motions ein. Funktioniert mit elisp-tree-sitter
;; oder native treesit (Emacs >= 29).
;;
;; Voraussetzung in packages.el:
;;   (package! evil-textobj-tree-sitter
;;     :recipe (:host github
;;              :repo "meain/evil-textobj-tree-sitter"
;;              :files (:defaults "queries" "treesit-queries")))
;;
;; HINWEIS: `evil-textobj-tree-sitter-get-textobj' ist ein MAKRO und expandiert
;; zur Ladezeit. Es braucht literale String-Argumente -- man kann es nicht in
;; einer Schleife mit Variablen aufrufen (sonst:
;;   "wrong-type-argument sequencep ...").
;; Deshalb ist hier jeder define-key explizit ausgeschrieben.

;;; Code:

(use-package! evil-textobj-tree-sitter
  :after evil
  :config
  ;; --- Textobjekte: af/if = function, ac/ic = class, usw. ---
  ;; function -> f
  (define-key evil-outer-text-objects-map "f"
              (evil-textobj-tree-sitter-get-textobj "function.outer"))
  (define-key evil-inner-text-objects-map "f"
              (evil-textobj-tree-sitter-get-textobj "function.inner"))
  ;; class -> c
  (define-key evil-outer-text-objects-map "c"
              (evil-textobj-tree-sitter-get-textobj "class.outer"))
  (define-key evil-inner-text-objects-map "c"
              (evil-textobj-tree-sitter-get-textobj "class.inner"))
  ;; conditional -> g
  (define-key evil-outer-text-objects-map "g"
              (evil-textobj-tree-sitter-get-textobj "conditional.outer"))
  (define-key evil-inner-text-objects-map "g"
              (evil-textobj-tree-sitter-get-textobj "conditional.inner"))
  ;; loop -> o
  (define-key evil-outer-text-objects-map "o"
              (evil-textobj-tree-sitter-get-textobj "loop.outer"))
  (define-key evil-inner-text-objects-map "o"
              (evil-textobj-tree-sitter-get-textobj "loop.inner"))
  ;; comment -> m
  (define-key evil-outer-text-objects-map "m"
              (evil-textobj-tree-sitter-get-textobj "comment.outer"))
  (define-key evil-inner-text-objects-map "m"
              (evil-textobj-tree-sitter-get-textobj "comment.inner"))
  ;; call -> u
  (define-key evil-outer-text-objects-map "u"
              (evil-textobj-tree-sitter-get-textobj "call.outer"))
  (define-key evil-inner-text-objects-map "u"
              (evil-textobj-tree-sitter-get-textobj "call.inner"))
  ;; parameter -> a  (auskommentieren, wenn du evil-args nutzt!)
  (define-key evil-outer-text-objects-map "a"
              (evil-textobj-tree-sitter-get-textobj "parameter.outer"))
  (define-key evil-inner-text-objects-map "a"
              (evil-textobj-tree-sitter-get-textobj "parameter.inner"))

  ;; --- Motions: zwischen Funktionen/Klassen springen (vim-unimpaired-Stil) ---
  (evil-define-key 'normal 'global
    (kbd "] f") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "function.outer"))
    (kbd "[ f") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "function.outer" t))
    (kbd "] F") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "function.outer" nil t))
    (kbd "[ F") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "function.outer" t t))
    (kbd "] c") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "class.outer"))
    (kbd "[ c") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "class.outer" t)))

  ;; --- Kotlin- und Zig-Grammatik registrieren (sonst leere Objekte in .kt-Buffern) ---
  (dolist (m '((kotlin-mode    . "kotlin")
               (kotlin-ts-mode . "kotlin")
               (zig-mode       . "zig")))
    (add-to-list 'evil-textobj-tree-sitter-major-mode-language-alist m))
  )

;;; evil-textobjects-tree-sitter.el ends here
