;;; go.el -*- lexical-binding: t; -*-

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)))
