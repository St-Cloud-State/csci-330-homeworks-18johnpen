(defun make-initial-pairs (lst)
  (cond
    ((null lst) '()) ; Empty list case
    ((null (cdr lst)) (list lst)) ; Single element case
    (t (let ((first (car lst))
             (second (cadr lst)))
         (cons (if (<= first second)
                   (list first second)
                   (list second first))
               (make-initial-pairs (cddr lst))))))) ; Recursive case

(defun merge-pairs (lists)
  (if (null (cdr lists)) ; Only one or no list left
      lists
      (cons (merge (car lists) (cadr lists)) ; Merge the first two lists
            (merge-pairs (cddr lists))))) ; Process the remaining lists

(defun merge (left right)
  (cond
    ((null left) right) ; If left is empty, return right
    ((null right) left) ; If right is empty, return left
    ((<= (car left) (car right)) ; Pick smaller item
     (cons (car left) (merge (cdr left) right)))
    (t
     (cons (car right) (merge left (cdr right))))))

(defun bottom-up-mergesort (lst)
  (let ((sorted-pairs (make-initial-pairs lst))) ;Create sorted pairs
    (loop while (cdr sorted-pairs) ; While more than one sublist remains
          do (setf sorted-pairs (merge-pairs sorted-pairs))) ; Merge in each pass
    (car sorted-pairs))) ; Final sorted list
