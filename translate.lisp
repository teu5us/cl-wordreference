;;;; translation.lisp

(defpackage #:cl-wordreference.translate
  (:use #:cl #:cl-wordreference.language)
  (:import-from #:cl-wordreference.conditions
                #:no-translation-found)
  (:export #:translate))

(in-package #:cl-wordreference.translate)

(defun retrieve-translation (lang-key-1 lang-key-2 word)
  (declare (type keyword lang-key-1 lang-key-2)
           (type string word))
  (let ((lang-1 (find-language lang-key-1))
        (lang-2 (find-language lang-key-2)))
    (if (and lang-1 lang-2)
        (translate-from-to lang-1 lang-2 word)
        (warn 'no-translation-found :short-1 lang-key-1
                                    :short-2 lang-key-2
                                    :word word))))

(defun print-wr-translation (stream translation columnp atsignp)
  (declare (ignorable columnp atsignp))
  (destructuring-bind (word translations examples)
      translation
    (format stream "** ~A
  ~@[~{~A~^,~^ ~}~]
~@[*** Examples
    ~{- ~A~^~%~}~%~]" word translations examples)))

(defun print-translation (translation &optional (stream *standard-output*))
  (loop :for table :in translation
        :do (destructuring-bind (title &rest data) table
              (format stream "* ~A
~{~/cl-wordreference.translate::print-wr-translation/~}" title data))))

(defun translate (lang-key-1 lang-key-2 word)
  (print-translation
   (retrieve-translation lang-key-1
                         lang-key-2
                         word)))
