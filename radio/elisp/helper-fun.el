;;; Emacs Lisp personal helper function
;; Author: Mohamed Ishmael Diwan Belghazi <ishmael.belghazi@gmail.com>

;;;; Print List: From https://www.gnu.org/software/emacs/manual/html_node/eintr/print_002delements_002dof_002dlist.html
(defun print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))
(provide 'helper-fun)
