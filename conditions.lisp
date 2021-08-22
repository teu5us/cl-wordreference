;;;; conditions.lisp

(defpackage #:cl-wordreference.conditions
  (:use #:cl)
  (:export #:unknown-language
           #:new-language
           #:redefining-language
           #:no-response
           #:no-translation-found))

(in-package #:cl-wordreference.conditions)

(define-condition unknown-language (simple-warning)
  ((short :initarg :short
          :reader short))
  (:report (lambda (condition stream)
             (format stream "No language matching ~A."
                     (short condition)))))

(define-condition new-language (simple-warning)
  ((name :initarg :name
         :reader name)
   (short :initarg :short
          :reader short)
   (pairs :initarg :pairs
          :reader pairs))
  (:report (lambda (condition stream)
             (with-slots (name short pairs) condition
               (format stream "Defining language ~S with:~%~5Tshort ~S~%~5Tpairs ~S."
                       name short pairs)))))

(define-condition redefining-language (new-language)
  ()
  (:report (lambda (condition stream)
             (with-slots (name short pairs) condition
               (format stream "Redefining language ~S with:~%~5Tshort ~S~%~5Tpairs ~S."
                       name short pairs)))))

(define-condition no-response (simple-warning)
  ((code :initarg :code
         :reader code))
  (:report (lambda (condition stream)
             (format stream "Could not get response from Wordreference, code: ~A"
                     (code condition)))))

(define-condition no-translation-found (simple-warning)
  ((short-1 :initarg :short-1
            :reader short-1)
   (short-2 :initarg :short-2
            :reader short-2)
   (word :initarg :word
         :reader word))
  (:report (lambda (condition stream)
             (with-slots (short-1 short-2 word) condition
               (format stream "No translation found for word ~S in pair ~A-~A."
                       word short-1 short-2)))))
