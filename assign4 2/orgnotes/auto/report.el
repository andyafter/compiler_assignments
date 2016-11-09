(TeX-add-style-hook
 "report"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "fixltx2e"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:orgheadline6"
    "sec:orgheadline1"
    "sec:orgheadline4"
    "sec:orgheadline2"
    "fig:orgparagraph1"
    "sec:orgheadline3"
    "sec:orgheadline5"
    "fig:orgparagraph2"
    "fig:orgparagraph3"
    "sec:orgheadline7"
    "fig:orgparagraph4"
    "sec:orgheadline8"
    "sec:orgheadline11"
    "sec:orgheadline9"
    "sec:orgheadline10")
   (LaTeX-add-environments
    '("corollary" LaTeX-env-args ["argument"] 1)
    '("proposition" LaTeX-env-args ["argument"] 1)
    '("reflection" LaTeX-env-args ["argument"] 1)
    '("exercise" LaTeX-env-args ["argument"] 1)
    '("lemma" LaTeX-env-args ["argument"] 1)
    '("theorem" LaTeX-env-args ["argument"] 1)))
 :latex)

