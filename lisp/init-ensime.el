;; Basic ensime support

(require-package 'ensime)

;; scala mode and ensime
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'init-ensime)
