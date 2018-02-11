(uiop:define-package :rodjek-scripts/git
  (:use :cl
        :uiop
        :cl-scripting
        :inferior-shell
        :fare-utils
        :rodjek-scripts/pass)
  (:export #:git-credential-pass
           #:git-update))

(in-package :rodjek-scripts/git)

(defparameter +credential-defaults+ '(("host" . "github.com")
                                      ("username" . "rodjek")))

(defun fetch-token (credential)
  (let* ((git-host (cdr (assoc "host" credential :test 'equal)))
         (password-name (format nil "~a/tokens/~a" git-host (uiop:hostname)))
         (password (rodjek-scripts/pass:get-password password-name)))
    (if (null password)
      (uiop:shell-boolean-exit 1)
      (acons "password" password credential))))

(defun parse-credential-line (line)
  (let ((split-credential-line (uiop:split-string line :separator "=" :max 2)))
    (cons (car split-credential-line) (cadr split-credential-line))))

(defun read-credential-request (defaults)
  (loop for line = (read-line *standard-input* nil :eof)
        until (eq line :eof)
        collect (parse-credential-line (uiop:stripln line)) into parsed
        finally (return (concatenate 'list parsed defaults))))

(defun write-credential (credential)
  (loop for cons in credential
        do (format t "~a=~a~%" (car cons) (cdr cons))))

(defun upstream-remote-p ()
  (multiple-value-bind (stdout stderr exit-code) (run/nil `(git remote show upstream) :on-error nil)
    (declare (ignorable stdout stderr))
    (= exit-code 0)))

(defun upstream-remote ()
  (if (upstream-remote-p)
    "upstream"
    "origin"))

(exporting-definitions
  (defun git-credential-pass (&rest argv)
    (declare (ignorable argv))
    (write-credential (fetch-token (read-credential-request +credential-defaults+)))
    (success))

  (defun git-update (&rest argv)
    (let* ((upstream (upstream-remote))
           (rebase-head (format nil "~a/master" upstream)))
      (run/i `(git fetch ,upstream))
      (run/i `(git rebase ,rebase-head)))
    (success)))

(register-commands :rodjek-scripts/git)
;;; vim: set ft=lisp lisp:
