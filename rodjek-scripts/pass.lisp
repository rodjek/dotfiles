(uiop:define-package :rodjek-scripts/pass
  (:use :cl :uiop)
  (:export #:get-password))

(in-package :rodjek-scripts/pass)

(defun get-password-raw (name)
  (uiop:run-program
    (format nil "pass show ~a" name)
    :output :string :ignore-error-status t))

(defun get-password (name)
  (multiple-value-bind (stdout stderr exit-code) (get-password-raw name)
    (declare (ignorable stderr))
    (if (= exit-code 0)
      (uiop:stripln stdout)
      nil)))
