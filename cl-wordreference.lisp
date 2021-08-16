;;;; cl-wordreference.lisp

(defpackage #:cl-wordreference
  (:use #:cl)
  (:import-from #:uiop #:quit))

(in-package #:cl-wordreference)

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
             (format stream "Defining language ~S with:~%~5Tshort ~S~%~5Tpairs ~S."
                     (name condition)
                     (short condition)
                     (pairs condition)))))

(define-condition redefining-language (new-language)
  ()
  (:report (lambda (condition stream)
             (format stream "Redefining language ~S with:~%~5Tshort ~S~%~5Tpairs ~S."
                     (name condition)
                     (short condition)
                     (pairs condition)))))

(define-condition no-response (simple-warning)
  ((code :initarg :code
         :reader code))
  (:report (lambda (condition stream)
             (format stream "Could not get response from Wordreference, code: ~A"
                     (code condition)))))

(define-condition unknown-dictionary (simple-warning)
  ((dict :initarg :dict
         :reader dict))
  (:report (lambda (condition stream)
             (format stream "Unknown dictionary: ~A." (dict condition)))))

(defvar *languages* nil)

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

(defun find-language (short)
  (or (find short *languages* :key #'short :test #'eql)
      (warn 'unknown-language :short short)))

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

(defclass language ()
  ((name :initarg :name
         :initform nil
         :accessor name)
   (short :initarg :short
          :initform nil
          :accessor short)
   (pairs :initarg :pairs
          :initform nil
          :accessor pairs))
  (:documentation "Class to represent languages."))

(defmethod make-pair ((lang-key-1 symbol) (lang-key-2 symbol) &key hyphen)
  (format nil "~(~A~@[-~*~]~A~)" lang-key-1 hyphen lang-key-2))

(defmethod make-pair ((lang-string-1 string) (lang-string-2 string) &key (hyphen t))
  (format nil "~A~@[-~*~]~A" lang-string-1 hyphen lang-string-2))

(defmethod make-pair ((obj-1 language) (obj-2 language) &key hyphen)
  (declare (ignorable hyphen))
  (values (make-pair (name obj-1) (name obj-2))
          (make-pair (short obj-1) (short obj-2))))

(defmethod translate-from-to ((obj-1 language) (obj-2 language) word dictionary)
  (declare (type string word)
           (type keyword dictionary))
  (multiple-value-bind (verbose-pair pair) (make-pair obj-1 obj-2)
    (declare (ignorable verbose-pair))
    (let ((html (get-wrd-response pair word dictionary))
          (parser
            (case dictionary
              ((:wordreference :wr :reverse :wrr)
               #'parse-wordreference)
              ((:collins :col)
               #'parse-collins))))
      (funcall parser html))))

(defun translate (lang-key-1 lang-key-2 word &key (dictionary :wordreference))
  (declare (type keyword lang-key-1 lang-key-2 dictionary)
           (type string word))
  (let ((lang-1 (find-language lang-key-1))
        (lang-2 (find-language lang-key-2)))
    (if (and lang-1 lang-2)
        (translate-from-to lang-1 lang-2 word dictionary)
        (warn 'no-translation-found :short-1 lang-key-1
                                    :short-2 lang-key-2
                                    :word word))))

(defun deflang (name short pairs)
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
(deflang "Russian" :ru '(:en))
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
