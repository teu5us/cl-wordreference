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

(defun make-wr-format-string (indent org/md)
  (format nil "~@[  ~*~]~:[**~;##~] ~~A~@[~%~*~]
  ~@[  ~*~]~~@[~~{~~A~~^,~~^ ~~}~~]~@[~%~*~]
~@[    ~*~]~~@[~:[***~;###~] Examples~@[~%~*~]
  ~@[    ~*~]~~{- ~~A~~^~~%~~}~~%~~]"
          indent org/md org/md
          indent org/md
          indent org/md org/md
          indent))

;; indent is columnp
;; org/md is atsignp
(defun print-wr-translation (stream translation indent org/md)
  (destructuring-bind (word translations examples)
      translation
    (format stream
            (make-wr-format-string indent org/md)
            word translations examples)))

(defun pre-format (indent org/md)
  (format nil "~:[*~;#~] ~~A~@[~%~*~]
~~{~~~@[@~*~]~@[:~*~]/cl-wordreference.translate::print-wr-translation/~~}"
          org/md org/md
          org/md indent))

(defun print-translation (translation &optional indent org/md (stream *standard-output*))
  (loop :for table :in translation
        :do (destructuring-bind (title &rest data) table
              (format stream
                      (pre-format indent org/md)
                      title
                      data))))

(defun translate (lang-key-1 lang-key-2 word &key (stream *standard-output*) (indent t) org/md)
  (print-translation
   (retrieve-translation lang-key-1
                         lang-key-2
                         word)
   indent org/md stream))
