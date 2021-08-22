;;;; net.lisp

(defpackage #:cl-wordreference.net
  (:use #:cl)
  (:import-from #:cl-wordreference.conditions
                #:unknown-language
                #:no-response)
  (:export #:get-wrd-response))

(in-package #:cl-wordreference.net)

(defun get-wrd-response (pair word)
  (let ((response (multiple-value-list
                   (ignore-errors
                    (dex:get (format nil
                                     "https://wordreference.com/redirect/translation.aspx?dict=~A&w=~A"
                                     pair
                                     (quri:url-encode word)))))))
    (destructuring-bind (response-text response-code &rest args)
        (or (when (car response) response)
            (with-accessors ((body dex:response-body)
                             (status dex:response-status))
                (cadr response)
              (list body status)))
      (declare (ignorable args))
      (if (eql response-code 200)
          response-text
          (warn 'no-response :code response-code)))))
