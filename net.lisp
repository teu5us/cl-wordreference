;;;; net.lisp

(defpackage #:cl-wordreference.net
  (:use #:cl)
  (:import-from #:cl-wordreference.conditions
                #:unknown-language
                #:no-response)
  (:export #:get-wrd-response))

(in-package #:cl-wordreference.net)

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
