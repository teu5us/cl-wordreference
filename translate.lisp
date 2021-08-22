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

(defun pre-format (indent format color &optional title)
  (if title
      (format nil "~@[[36m~*~]~[>>>~;#~;*~] ~~A~@[[0m~*~]~[~;~%~;~]
~~{~~~A~@[@~*~]~@[:~*~]/cl-wordreference.translate::print-wr-translation/~~}"
              color format color format
              format color indent)
      (format nil "~~@[~@[  ~*~]~@[[32m~*~]~[==>~;##~;**~] ~~A~@[[0m~*~]~[~;~%~;~]
  ~@[  ~*~]~~@[~~{~~A~~^,~~^ ~~}~~]~[~;~%~;~]
~~@[~@[    ~*~]~@[[33m~*~]~[-->~;###~;***~] Examples~@[[0m~*~]~[~;~%~;~]
  ~@[    ~*~]~~{- ~~A~~^~~%~~}~~%~~]~[~;~%~;~]~~]"
          indent color format color format
          indent format
          indent color format color format
          indent format)))

(defun print-wr-translation (stream translation indent color format)
  (destructuring-bind (word translations examples)
      translation
    (format stream
            (pre-format indent format color)
            word translations examples)))

(defun print-translation (translation &optional indent format color (stream *standard-output*))
  (loop :for table :in translation
        :do (destructuring-bind (title &rest data) table
              (format stream
                      (pre-format indent format color title)
                      title
                      data))))

(defun translate (lang-key-1 lang-key-2 word &key
                                               (stream *standard-output*)
                                               indent
                                               (format 0)
                                               nocolor)
  (print-translation
   (retrieve-translation lang-key-1
                         lang-key-2
                         word)
   indent format (null nocolor) stream))
