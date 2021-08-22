;;;; parse.lisp

(defpackage #:cl-wordreference.parse
  (:use #:cl)
  (:export #:parse-wordreference))

(in-package #:cl-wordreference.parse)

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
        :finally (return (list word
                               translations
                               examples))))

(defun parse-wordreference-table (table)
  (let ((table-title (lquery:$1 table ".wrtopsection" "strong" (text)))
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
