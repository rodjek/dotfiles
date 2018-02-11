#-asdf3.1 (error "Requires ASDF 3.1 or higher")

(defsystem "rodjek-scripts"
  :version "0.0.1"
  :description "rodjeks scripts"
  :license "MIT"
  :author "Tim Sharpe"
  :class :package-inferred-system
  :depends-on ((:version "cl-scripting" "0.1")
               (:version "inferior-shell" "2.0.3.3")
               (:version "fare-utils" "1.0.0.5")
               "rodjek-scripts/main"
               "rodjek-scripts/git"
               "rodjek-scripts/pass"
               "rodjek-scripts/utils"
               "rodjek-scripts/mail"))

;; vim: set ft=lisp lisp:
