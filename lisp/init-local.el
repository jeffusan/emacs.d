;;; Commentary:

;; scala mode and ensime
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(push "/usr/local/bin/sbt" exec-path)
(push "/Users/jeff/.svm/current/rt/bin/scala" exec-path)
(push "/Applications/Postgres.app/Contents/Versions/9.4/bin/psql" exec-path)

(gradle-mode 0)
;;; Code:

(setq org-directory "~/Documents/orgs/")
(setq org-default-notes-file "~/Documents/orgs/.notes")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

;;templates
(setq org-capture-templates
  '(
    ("t" "Todo" entry (file+headline "~/Documents/orgs/gtd/newgtd.org" "Tasks") "* TODO %^{Brief Description} %^g\n%?\nAdded: %U\n %i\n %a\n\n")
    ("j" "Journal" entry (file_datetree "~/Documents/orgs/gtd/journal.org") "* %?\Entered on %U\n %i\n %a")
    ("p" "Project" entry (file+headline "~/Documents/orgs/gtd/newgtd.org" "Projects") "* %^{Brief Description} %^g\n%?\nAdded: %U\n %i\n %a")
    ("d" "Daily Review" entry (file+headline "~/Documents/orgs/gtd/journal.org" "Daily Review") "** %t :COACH: \n%[~/Documents/orgs/.daily_review.txt]\n")
    ("s" "Someday" entry (file+headline "~/Documents/orgs/gtd/someday.org" "Someday") "* TODO %^{Brief Description} %^\n%?\nAdded: %U\n %i\n %a\n\n")
    ))

;; settings
(setq org-src-fontify-natively t)
(setq org-log-done t)
(setq org-log-repeat "time")
(setq org-agenda-include-diary nil)
(setq org-deadline-warning-days 7)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)

;; refile settings
(setq org-refile-targets
      (quote
       (
        ("~/Documents/orgs/gtd/refiled.org" :maxlevel . 1)
        ("~/Documents/orgs/gtd/someday.org" :level . 1)
        ("~/Documents/orgs/gtd/follow_up.org" :level . 1)
       )
      )
      )

(setq org-agenda-files
 (quote
  (
   "~/Documents/orgs/gtd/newgtd.org"
   "~/Documents/orgs/gtd/calendar.org"
   )
  )
 )


;; split windows
(global-set-key [f6] 'split-window-horizontally)
(global-set-key [f7] 'split-window-vertically)

(global-set-key [f8] 'delete-window)

;; switch to other window
(global-set-key [f1] 'other-window)

;; org bindings
(define-key global-map "\C-cr" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)

(global-set-key (kbd "M-<right>") 'paredit-forward-slurp-sexp)
;(global-set-key (kbd "M-<left>") 'paredit-backward-barf-sexp)


(load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")


(provide 'init-local)
