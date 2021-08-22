;;;; language.lisp

(defpackage #:cl-wordreference.language
  (:use #:cl #:cl-wordreference.net #:cl-wordreference.parse)
  (:import-from #:cl-wordreference.conditions
                #:unknown-language
                #:new-language
                #:redefining-language)
  (:export #:translate-from-to
           #:find-language
           #:print-languages))

(in-package #:cl-wordreference.language)

(defclass language ()
  ((name :initarg :name
         :initform nil
         :accessor name)
   (short :initarg :short
          :initform nil
          :accessor short)
   (pairs :initarg :pairs
          :initform nil
          :accessor pairs)
   (available :initarg :available
              :initform t
              :accessor available))
  (:documentation "Class to represent languages."))

(defmethod make-pair ((lang-key-1 symbol) (lang-key-2 symbol) &key hyphen)
  (format nil "~(~A~@[-~*~]~A~)" lang-key-1 hyphen lang-key-2))

(defmethod make-pair ((lang-string-1 string) (lang-string-2 string) &key (hyphen t))
  (format nil "~A~@[-~*~]~A" lang-string-1 hyphen lang-string-2))

(defmethod make-pair ((obj-1 language) (obj-2 language) &key hyphen)
  (declare (ignorable hyphen))
  (values (make-pair (name obj-1) (name obj-2))
          (make-pair (short obj-1) (short obj-2))))

(defmethod translate-from-to ((obj-1 language) (obj-2 language) word)
  (declare (type string word))
  (multiple-value-bind (verbose-pair pair) (make-pair obj-1 obj-2)
    (declare (ignorable verbose-pair))
    (parse-wordreference (get-wrd-response pair word))))

(defvar *languages* nil)

(defun print-languages ()
  (dolist (l (sort *languages*
                   #'(lambda (l1 l2)
                       (string< (name l1) (name l2)))))
    (with-slots (name short) l
      (format t "~A ~A~%" name short))))

(defun find-language (short)
  (or (find short *languages* :key #'short :test #'eql)
      (warn 'unknown-language :short short)))

(defun deflang (name short pairs &optional (available t))
  (let ((lang (find-language short))
        (definitions (list :name name
                           :short short
                           :pairs pairs)))
    (if lang
        (progn
          (apply #'warn 'redefining-language definitions)
          (setf (name lang) name
                (short lang) short
                (pairs lang) pairs))
        (progn
          (apply #'warn 'new-language definitions)
          (push (apply #'make-instance 'language definitions)
                *languages*)))))

(deflang "English" :en '(:es :fr :it :de :nl :sv :ru :pt :pl :ro :cz :el :tr :zh :ja :ko :ar))
(deflang "Spanish" :es '(:en :fr :pt :it :de :ca))
(deflang "French" :fr '(:en :es))
(deflang "Italian" :it '(:en :es))
(deflang "German" :de '(:en :es))
(deflang "Dutch" :nl '(:en))
(deflang "Swedish" :sv '(:en))
(deflang "Russian" :ru '(:en) nil)
(deflang "Portuguese" :pt '(:en :es))
(deflang "Polish" :pl '(:en))
(deflang "Romanian" :ro '(:en))
(deflang "Czech" :cz '(:cz))
(deflang "Greek" :el '(:en))
(deflang "Greek" :el '(:en))
(deflang "Turkish" :tr '(:en))
(deflang "Chinese" :zh '(:en))
(deflang "Japanese" :ja '(:en))
(deflang "Korean" :ko '(:en))
(deflang "Arabic" :ar '(:en))
