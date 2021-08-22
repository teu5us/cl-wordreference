# cl-wordreference

CL-WORDREFERENCE is a command-line interface to [wordreference.com](https://wordreference.com).

## Usage

```
Interface to wordreference.com

Usage: wordref [-h|--help] [-f|--from ARG] [-t|--to ARG] [-n|--noindent]
               [-F|--format ARG] [-N|--nocolor] [-l|--langs] [WORD]

Available options:
  -h, --help       Print this help.
  -f, --from ARG   Language to translate from.
  -t, --to ARG     Language to translate to.
  -n, --noindent   Remove indentation.
  -F, --format ARG Format to use: [plain|md|markdown|org].
  -N, --nocolor    Remove colors.
  -l, --langs      Print supported languages.
```

Languages and language codes:

```
Arabic AR
Chinese ZH
Czech CZ
Dutch NL
English EN
French FR
German DE
Greek EL
Italian IT
Japanese JA
Korean KO
Polish PL
Portuguese PT
Romanian RO
Russian RU
Spanish ES
Swedish SV
Turkish TR
```

Doom emacs example:

```
(defvar wordreference-language-pair '("tr" "en"))
(defvar wordreference-history nil)

(defun ask-wordreference (term &optional beg end)
  (interactive (cond
                ((use-region-p)
                 (list nil (region-beginning) (region-end)))
                ((eql major-mode 'exwm-mode)
                 (list (gui-get-primary-selection) nil nil))
                (t
                 (list nil nil nil))))
  (flet ((cpa ()
              (or (car current-prefix-arg) 0))
         (ask-word ()
                   (string-trim (read-string "Word to translate: " nil 'wordreference-history nil t)))
         (ask-lang (str)
                   (completing-read str
                                    (mapcar #'(lambda (str) (cadr (split-string str " " t)))
                                            (split-string (shell-command-to-string "wordref -l") "\n" t))
                                    nil t)))
    (let* ((word (cond
                  ((or (= (cpa) 4)
                       (>= (cpa) 64))
                   (ask-word))
                  (term term)
                  ((and beg end)
                   (buffer-substring-no-properties beg end))
                  ((current-word t t)
                   (current-word t t))
                  (t
                   (ask-word)))))
      (cl-destructuring-bind (l1 l2) (cond
                                      ((= (cpa) 16)
                                       (reverse wordreference-language-pair))
                                      ((>= (cpa) 64)
                                       (list (ask-lang "From: ") (ask-lang "To: ")))
                                      (t
                                       wordreference-language-pair))
        (with-help-window "*Wordreference*"
          (princ (shell-command-to-string
                  (format "wordref -nN -F org -f %s -t %s \"%s\""
                          l1 l2 word))))
        (with-current-buffer "*Wordreference*"
          (org-mode))))))

(set-popup-rule! "^\\*Wordreference" :slot -1 :size 0.3 :select t)
```

## License

MIT
