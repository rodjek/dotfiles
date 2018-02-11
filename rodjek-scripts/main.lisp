(uiop:define-package :rodjek-scripts/main
  (:use :cl
        :uiop
        :cl-scripting
        :inferior-shell
        :fare-utils
        :cl-launch/dispatch)
  (:export #:make-script-symlinks
           #:main))

(in-package :rodjek-scripts/main)

(defun no-symlink-p (command)
  (or
    (string= command "main")
    (string= command "make-script-symlinks")))

(defun command-list ()
  (remove-if #'no-symlink-p (cl-launch/dispatch:all-entry-names)))

(exporting-definitions
  (defun make-script-symlinks (src)
    (let ((bindir (resolve-absolute-location `(,(subpathname (user-homedir-pathname) ".bin/")) :ensure-directory t)))
      (with-current-directory (bindir)
        (dolist (i (command-list))
          (run `(ln -sf ,src ,i)))))
      (success))

  (defun main (argv)
    (format t "commands: ~{~A~^ ~}~%" (command-list))
    (success)))

(register-commands :rodjek-scripts/main)
;;; vim: set ft=lisp lisp:
