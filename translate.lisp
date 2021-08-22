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

(defun pre-format (indent org/md color &optional title)
  (if title
      (format nil "~@[[36m~*~]~:[*~;#~] ~~A~@[[0m~*~]~@[~%~*~]
~~{~~~@[1~*~]~@[@~*~]~@[:~*~]/cl-wordreference.translate::print-wr-translation/~~}"
              color org/md color org/md
              color org/md indent)
      (format nil "~~@[~@[  ~*~]~@[[32m~*~]~:[**~;##~] ~~A~@[[0m~*~]~@[~%~*~]
  ~@[  ~*~]~~@[~~{~~A~~^,~~^ ~~}~~]~@[~%~*~]
~~@[~@[    ~*~]~@[[33m~*~]~:[***~;###~] Examples~@[[0m~*~]~@[~%~*~]
  ~@[    ~*~]~~{- ~~A~~^~~%~~}~~%~~]~@[~%~*~]~~]"
          indent color org/md color org/md
          indent org/md
          indent color org/md color org/md
          indent org/md)))

;; indent is columnp
;; org/md is atsignp
(defun print-wr-translation (stream translation indent org/md &optional color)
  (destructuring-bind (word translations examples)
      translation
    (format stream
            (pre-format indent org/md color)
            word translations examples)))

(defun print-translation (translation &optional indent org/md color (stream *standard-output*))
  (loop :for table :in translation
        :do (destructuring-bind (title &rest data) table
              (format stream
                      (pre-format indent org/md color title)
                      title
                      data))))

(defun translate (lang-key-1 lang-key-2 word &key
                                               (stream *standard-output*)
                                               indent
                                               org/md
                                               nocolor)
  (print-translation
   (retrieve-translation lang-key-1
                         lang-key-2
                         word)
   indent org/md (null nocolor) stream))
