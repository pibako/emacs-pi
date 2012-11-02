;;; rudel-interactive.el --- User interaction functions for Rudel.
;;
;; Copyright (C) 2008, 2009 Jan Moringen
;;
;; Author: Jan Moringen <scymtym@users.sourceforge.net>
;; Keywords: Rudel, user, interface, interaction
;; X-RCS: $Id:$
;;
;; This file is part of Rudel.
;;
;; Rudel is free software: you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; Rudel is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with Rudel. If not, see <http://www.gnu.org/licenses>.


;;; Commentary:
;;
;; Functions for user interactions commonly used in Rudel components.


;;; History:
;;
;; 0.1 - Initial revision.


;;; Code:
;;

(require 'rudel-compat) ;; for `read-color' replacement


;;; Function for reading Rudel objects from the user.
;;

(defun rudel-read-backend (backends &optional prompt return)
  "Read a backend name from BACKENDS and return that name or the actual backend depending on RETURN.
If RETURN is 'object, return the backend object which is of the
form (NAME . CLASS-OR-OBJECT); Otherwise return the name as
string."
  (unless prompt
    (setq prompt "Backend: "))
  (let* ((backend-names (mapcar (lambda (cell)
				  (symbol-name (car cell)))
				backends))
	 (backend-name  (completing-read prompt backend-names nil t)))
    (cond
     ((eq return 'object)
       (assoc (intern backend-name) backends))
     (t backend-name)))
  )

(defun rudel-read-session (sessions &optional prompt return)
  "Read a session name from SESSIONS and return that name or the session info depending on RETURN.
If PROMPT is non-nil use as prompt string.
If RETURN is 'object, return the session object; Otherwise return
the name as string."
  (unless prompt
    (setq prompt "Session: "))
  ;; For presentation and identification of sessions, use the :name
  ;; property.
  (flet ((to-string (session)
		    (if (rudel-backend-cons-p session)
			(symbol-name (car session))
		      (plist-get session :name))))
    ;; Read a session by name, then return that name or the
    ;; corresponding session info.
    (let ((session-name (completing-read prompt
					 (mapcar #'to-string sessions)
					 nil t)))
      (cond
       ((eq return 'object)
	(find session-name sessions
	      :key  #'to-string :test #'string=))
       (t session-name))))
  )

(defun rudel-read-user-name ()
  "Read a username.
The default is taken from `rudel-default-username'."
  (read-string "Username: " rudel-default-username))

(defun rudel-read-user-color ()
  "Read a color."
  (read-color "Color: " t))

(defun rudel-read-user (&optional users prompt return)
  "Read a user name from USERS and return that name or the actual user depending on RETURN.
If USERS is nil, use the user list of `rudel-current-session'.
If RETURN. is 'object, return the user object; Otherwise return
the name as string."
  ;; If no user list is provided, the user list of the current session
  ;; is used.
  (unless users
    (if rudel-current-session
	(setq users (oref rudel-current-session :users))
      (error "No user list and no active Rudel session")))
  (unless prompt
    (setq prompt "User: "))
  ;; Construct a list of user name, read a name with completion and
  ;; return a user name of object.
  (let* ((user-names (mapcar 'object-name-string users))
	 (user-name  (completing-read prompt user-names nil t)))
    (cond
     ((eq return 'object)
      (find user-name users
	    :test 'string= :key 'object-name-string))
     (t user-name)))
  )

(defun rudel-read-document (&optional documents prompt return)
  "Read a document name from DOCUMENTS and return that name or the actual document depending on RETURN.
If RETURN. is 'object, return the backend object; Otherwise
return the name as string."
  (unless documents
    (if rudel-current-session
	(setq documents (oref rudel-current-session :documents))
      (error "No document list and no active Rudel session")))
  (unless documents
    (error "No documents")) ; TODO error is a bit harsh
  (unless prompt
    (setq prompt "Document: "))

  ;; Construct list of names, read one name and return that name or
  ;; the named object.
  (let* ((document-names (mapcar #'rudel-unique-name documents))
	 (document-name  (completing-read prompt document-names nil t)))
    (cond
     ((eq return 'object)
      (find document-name documents
	    :test #'string= :key #'rudel-unique-name))
     (t document-name)))
  )


;;; Buffer allocation functions
;;

(defun rudel-allocate-buffer-clear-existing (name)
  "When the requested buffer NAME exists, clear its contents and use it."
  (let ((buffer (get-buffer name)))
    (if buffer
	(progn
	  ;; Ask the user whether it is OK to erase the contents of
	  ;; the buffer.
	  (unless (yes-or-no-p (format
				"Buffer `%s' already exists; Erase contents? "
				name))
	    (error "Buffer `%s' already exists" name)) ;; TODO throw or signal; not error
	  ;; When the buffer is attached to a different document, ask
	  ;; whether it is OK to detach the buffer.
	  (let ((document (rudel-buffer-document buffer)))
	    (unless (or (not document)
			(yes-or-no-p (format
				      "Buffer `%s' is attached to the document `%s'; Detach? "
				      name
				      (rudel-unique-name document))))
	      (error "Buffer `%s' already attached to a document" name)))
	  ;; Delete buffer contents; maybe detach buffer first.
	  (when (rudel-buffer-has-document-p buffer)
	    (rudel-unpublish-buffer buffer))
	  (with-current-buffer buffer
	    (erase-buffer)))
      (setq buffer (get-buffer-create name)))
    buffer)
  )

(defun rudel-allocate-buffer-make-unique (name)
  "When the requested buffer NAME exists, create another buffer."
  (get-buffer-create (generate-new-buffer-name name)))

(provide 'rudel-interactive)
;;; rudel-interactive.el ends here
