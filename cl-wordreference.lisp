;;;; cl-wordreference.lisp

(defpackage #:cl-wordreference
  (:use #:cl #:cl-wordreference.translate)
  (:import-from #:uiop #:quit))

(in-package #:cl-wordreference)

(defun parse-lang (arg)
  (intern (string-upcase arg) :keyword))

(defun parse-format (arg)
  (let ((format (unless (string-equal arg "")
                  (intern (string-upcase arg) :keyword))))
    (case format
      ((:md :markdown) 1)
      (:org 2)
      (otherwise 0))))

(opts:define-opts
  (:name :help
   :description "Print this help."
   :short #\h
   :long "help")
  (:name :from
   :description "Language to translate from."
   :short #\f
   :long "from"
   :arg-parser #'parse-lang)
  (:name :to
   :description "Language to translate to."
   :short #\t
   :long "to"
   :arg-parser #'parse-lang)
  (:name :indent
   :description "Remove indentation."
   :short #\n
   :long "noindent")
  (:name :format
   :description "Format to use: [plain|md|markdown|org]."
   :short #\F
   :long "format"
   :arg-parser #'parse-format)
  (:name :nocolor
   :description "Remove colors."
   :short #\N
   :long "nocolor"))

(defun unknown-option (condition)
  (format t "warning: ~s option is unknown!~%" (opts:option condition))
  (invoke-restart 'opts:skip-option))

(defmacro when-option ((options opt) &body body)
  `(let ((it (getf ,options ,opt)))
     (when it
       ,@body)))

(defun main (&rest args)
  (declare (ignorable args))
  (multiple-value-bind (options free-args)
      (handler-case
          (handler-bind ((opts:unknown-option #'unknown-option))
            (opts:get-opts))
        (opts:missing-arg (condition)
          (format t "fatal: option ~s needs an argument!~%"
                  (opts:option condition)))
        (opts:arg-parser-failed (condition)
          (format t "fatal: cannot parse ~s as argument of ~s~%"
                  (opts:raw-arg condition)
                  (opts:option condition)))
        (opts:missing-required-option (con)
          (format t "fatal: ~a~%" con)
          (opts:exit 1)))
    (when-option (options :help)
      (opts:describe
       :prefix "interface to wordreference.com"
       :suffix ""
       :usage-of "wordref"
       :args     "[WORD]"))
    (if free-args
        (when-option (options :from)
          (when-option (options :to)
            (translate (getf options :from)
                       (getf options :to)
                       (format nil "~{~A~^ ~}" free-args)
                       :indent (null (getf options :indent))
                       :format (or (getf options :format) 0)
                       :nocolor (getf options :nocolor))))
        (progn
          (format t "No word supplied.~%")
          (quit 1)))))
