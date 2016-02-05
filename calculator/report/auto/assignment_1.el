(TeX-add-style-hook
 "assignment_1"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("color" "usenames" "dvipsnames")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "fancyhdr"
    "lastpage"
    "extramarks"
    "color"
    "graphicx"
    "listings"
    "courier"
    "lipsum")
   (TeX-add-symbols
    '("problemAnswer" 1)
    '("exitProblemHeader" 1)
    '("enterProblemHeader" 1)
    '("perlscript" 2)
    "homeworkProblemName"
    "homeworkSectionName"
    "hmwkTitle"
    "hmwkDueDate"
    "hmwkClass"
    "hmwkClassTime"
    "hmwkClassInstructor"
    "hmwkAuthorName")
   (LaTeX-add-environments
    '("homeworkProblem" LaTeX-env-args ["argument"] 0)
    '("homeworkSection" 1))
   (LaTeX-add-counters
    "homeworkProblemCounter")
   (LaTeX-add-color-definecolors
    "MyDarkGreen")))

