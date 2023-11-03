(asdf:defsystem #:crapi
  :class :package-inferred-system
  :description "CReate API clients from OpenAI specs"
  :author "IAmRasputin (ryanmgannon@gmail.com)"
  :license "GPLv3"
  :version "0.0.1"
  :serial t
  :depends-on ("com.inuoe.jzon" "dexador" "alexandria" "serapeum")
  :components ((:file "crapi")))
