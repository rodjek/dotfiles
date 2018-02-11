(uiop:define-package :rodjek-scripts/utils
  (:use :cl :uiop)
  (:export #:with-file-lock))

(in-package :rodjek-scripts/utils)

(defmacro with-file-lock (path &body body)
  (let ((lock-path (gensym))
        (lock-file (gensym)))
    `(let ((,lock-path (format nil "~a.lock" (namestring ,path))))
       (unwind-protect
         (progn
           (loop
             :for ,lock-file = (open ,lock-path :direction :output
                                     :if-exists nil
                                     :if-does-not-exist :create)
             :until ,lock-file
             :do (sleep 0.1)
             :finally (close ,lock-file))
           ,@body)
         (ignore-errors (delete-file ,lock-path))))))
