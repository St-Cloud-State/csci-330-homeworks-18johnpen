(defun partition (lst)
  (cond
    ((null lst) (values '() '())) ; Check for empty list
    ((null (cdr lst)) (values lst '())) ; Check for single item, goes in left partition
    (t (multiple-value-bind (left right) (partition (cddr lst)) ; Recursive call on the rest
         (values (cons (car lst) left) (cons (cadr lst) right))))))

(defun merge (left right)
  (cond ((null left) right) ; If left list is empty, return right list
        ((null right) left) ; If right list is empty, return left list
        ((<= (car left) (car right)) ; Pick the smaller head and recurse
         (cons (car left) (merge (cdr left) right)))
        (t
         (cons (car right) (merge left (cdr right))))))

(defun mergesort (lst)
  (if (or (null lst) (null (cdr lst))) ; If the list is empty or has one element, it's sorted
      lst
      (multiple-value-bind (left right) (partition lst)
        (merge (mergesort left) (mergesort right)))))