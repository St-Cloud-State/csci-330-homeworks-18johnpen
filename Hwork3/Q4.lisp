(defun insert-into-sorted (item sorted examined)
  (cond
    ((null sorted) ; Insert at the end if sorted list is empty
     (append examined (list item)))  
    ((<= item (car sorted)) ; Found correct position, insert before
     (append examined (list item) sorted))
    (t  ; Recurse 
     (insert-into-sorted item (cdr sorted) (append examined (list (car sorted)))))))

(defun insertion-sort (unsorted sorted)
  (if (null unsorted) ; No more elements to sort
      sorted
      (insertion-sort (cdr unsorted) ; Recursive case
          (insert-into-sorted (car unsorted) sorted '()))))

