(uiop:define-package :rodjek-scripts/mail
  (:use :cl
        :uiop
        :cl-scripting
        :inferior-shell
        :fare-utils
        :rodjek-scripts/utils)
  (:export #:sync-mail))

(in-package :rodjek-scripts/mail)

(defparameter +fast-mailboxes+ '("personal"
                                 "personal-sent"
                                 "personal-trash"
                                 "personal-drafts"
                                 "puppet"
                                 "puppet-sent"
                                 "puppet-trash"
                                 "puppet-drafts"))
(defparameter +lock-file-path+ #P"/tmp/sync-mail")

(defun mailboxes-to-sync (mode)
  (if (string= mode "fast")
    +fast-mailboxes+
    "-a"))

(exporting-definitions
  (defun sync-mail (&rest argv)
    (let ((mailboxes (mailboxes-to-sync (car argv))))
      (with-file-lock +lock-file-path+
        (run/i `(mbsync ,mailboxes))
        (run/i `(notmuch new))))
    (success)))

(register-commands :rodjek-scripts/mail)
