;;;; cl-wordreference.lisp

(defpackage #:cl-wordreference
  (:use #:cl)
  (:import-from #:uiop #:quit)
  (:import-from #:cl-wordreference.conditions
                #:unknown-dictionary
                #:no-response
                #:no-translation-found))

(in-package #:cl-wordreference)

(defun group-by (lst key test)
  (loop :for item :in lst
        :with result = nil
        :with collection = nil
        :do (progn
              (unless (funcall test (funcall key item)
                               (funcall key (car collection)))
                (unless (null collection)
                  (push (reverse collection) result)
                  (setf collection nil)))
              (push item collection))
        :finally (progn
                   (push (reverse collection) result)
                   (return (reverse result)))))

(defun choose-dictionary (dictionary)
  (case dictionary
    ((:wordreference :wr)
     "https://wordreference.com/~A/~A")
    ((:collins :col)
     "https://wordreference.com/2012/collins/loadCollins.aspx?dict=~A&w=~A")
    ((:reverse :wrr)
     "https://wordreference.com/~A/reverse/~A")
    (otherwise
     (progn (warn 'unknown-dictionary :dict dictionary)
            (format t "Quitting.")))))

(defun extract-collins-html (response-text)
  (let ((content-line
          (find "innerHTML"
                (str:split (format nil ";~A~A" #\Return #\Newline) response-text)
                :test #'(lambda (substr str)
                          (search substr str)))))
    (string-trim '(#\")
                 (subseq content-line (+ 2 (search "=" content-line))))))

(defun get-wrd-response (pair word dictionary)
  (let ((response (multiple-value-list
                   (ignore-errors
                    (dex:get (format nil (choose-dictionary dictionary)
                                     (quri:url-encode pair)
                                     (quri:url-encode word)))))))
    (destructuring-bind (response-text response-code &rest args)
        (or (when (car response) response)
            (with-accessors ((body dex:response-body)
                             (status dex:response-status))
                (cadr response)
              (list body status)))
      (declare (ignorable args))
      (if (eql response-code 200)
          (if (or (eql dictionary :collins)
                  (eql dictionary :col))
              (extract-collins-html response-text)
              response-text)
          (warn 'no-response :code response-code)))))

(defmacro flipped-push (place obj)
  `(push ,obj ,place))

(defmacro lquery-s/p (f what-to-s/p lquery-query)
  (declare (type keyword f))
  (let ((function (case f
                    (:s 'setf)
                    (:p 'flipped-push))))
    `(let ((search-result ,lquery-query))
       (when search-result (,function ,what-to-s/p search-result)))))

(defun parse-wordreference-table-group (group)
  (loop :for row :in group
        :with word
        :with translations = nil
        :with examples = nil
        :do (progn
              (lquery-s/p :s word
                          (str:trim
                           (let* ((from (lquery:$1 row ".FrWrd"))
                                  (em (when from (plump:get-elements-by-tag-name from "em"))))
                             (when em (plump:remove-child (car em)))
                             (lquery:$1 from (text)))))
              (lquery-s/p :p translations
                          (str:trim
                           (let* ((to (lquery:$1 row ".ToWrd"))
                                  (em (when to (plump:get-elements-by-tag-name to "em"))))
                             (when em (plump:remove-child (car em)))
                             (lquery:$1 to (text)))))
              (lquery-s/p :p examples
                          (lquery:$1 row ".FrEx" (text))))
        :finally (return (list :word word
                               :translations translations
                               :examples examples))))

(defun parse-wordreference-table (table)
  (let ((table-title (lquery:$1 table ".wrtopsection" (text)))
        (table-as-rows (lquery:$ table "tr")))
    (destructuring-bind (title pairs &rest rows)
        (coerce table-as-rows 'list)
      (declare (ignorable title pairs))
      (let ((grouped-rows
              (group-by rows
                         #'(lambda (tr)
                             (lquery:$1 tr (attr :class)))
                         #'string-equal)))
        (cons table-title
              (loop :for group :in grouped-rows
                    :collect (parse-wordreference-table-group group)))))))

(defun parse-wordreference (html)
  (let* ((root (plump:parse html))
         (body (lquery:$1 root "div#articleWRD"))
         (translation-tables (lquery:$ body "table.WRD")))
    (loop :for table :across translation-tables
          :collect (parse-wordreference-table table))))

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
