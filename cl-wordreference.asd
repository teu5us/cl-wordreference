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
               (:file "translate")
               (:file "cl-wordreference"))
  :build-operation "program-op"
  :build-pathname #.(or (uiop:getenv "WORDREF")
                        "wordref")
  :entry-point "cl-wordreference::main")

#+sb-core-compression
(defmethod asdf:perform ((o asdf:image-op) (c asdf:system))
  (uiop:dump-image (asdf:output-file o c) :executable t :compression t))
