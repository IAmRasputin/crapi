(in-package :cl-user)
(defpackage #:crapi
  (:use :cl :alexandria :serapeum)
  (:import-from :com.inuoe.jzon)
  (:local-nicknames (:json :com.inuoe.jzon)))
(in-package :crapi)

