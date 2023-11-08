(in-package :cl-user)
(defpackage #:crapi
  (:use :cl :alexandria :serapeum)
  (:import-from :com.inuoe.jzon)
  (:local-nicknames (:json :com.inuoe.jzon)))
(in-package :crapi)

;; Spec files (either Swagger 2 or OpenAPI 3/3.1) are parsed and CLOS objects are created representing
;; the API.  From this object, we dump the client to a .lisp file to be loaded normally.

(defun load-spec-file (filename)
  "Load a JSON spec from a file, and return it as a hash-map for further processing"
  (load-spec (read-file-into-string filename)))

(defun load-spec (in)
  "load a JSON spec from a json string or stream, and return it as a hash-map for further processing"
  (let ((spec (json:parse in)))
    (validate-spec spec)))

(defun validate-spec (spec)
  (and
   (validate-spec-version spec)
   ;; ...
   spec))

(defun validate-spec-version (spec)
  (assert (typep spec 'hash-table))
  (let ((swagger-version (gethash "swagger" spec))
        (openapi-version (gethash "openapi" spec)))
    (cond
      (swagger-version (if (equal swagger-version "2.0")
                           t
                           (error "Invalid spec version: Swagger 2.0 or OpenAPI 3.* required")))
      (openapi-version (if (string^= "3." openapi-version)
                           t
                           (error "Invalid spec version: Swagger 2.0 or OpenAPI 3.* required")))
      (t (error "Could not find OpenAPI/Swagger specification version at toplevel")))))
