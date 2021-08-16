;;;; cl-wordreference.asd

(asdf:defsystem #:cl-wordreference
  :description "An interface to wordreference.com"
  :author "Pavel Stepanov <paulkreuzmann@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:lquery
               #:plump
               #:str
               #:dexador
               #:quri
               #:unix-opts)
  :components ((:file "conditions")
               (:file "net")
               (:file "parse")
               (:file "language")
               (:file "cl-wordreference")))
