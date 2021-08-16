;;;; cl-wordreference.lisp

(defpackage #:cl-wordreference
  (:use #:cl #:cl-wordreference.language)
  (:import-from #:uiop #:quit)
  (:import-from #:cl-wordreference.conditions
                #:no-translation-found)
  (:export #:translate))

(in-package #:cl-wordreference)

(defun translate (lang-key-1 lang-key-2 word &key (dictionary :wordreference))
  (declare (type keyword lang-key-1 lang-key-2 dictionary)
           (type string word))
  (let ((lang-1 (find-language lang-key-1))
        (lang-2 (find-language lang-key-2)))
    (if (and lang-1 lang-2)
        (translate-from-to lang-1 lang-2 word dictionary)
        (warn 'no-translation-found :short-1 lang-key-1
                                    :short-2 lang-key-2
                                    :dictionary dictionary
                                    :word word))))
