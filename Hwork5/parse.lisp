; I => iESI' \ I' => eS|ε \ E => GE' \ E' => oGE'|ε \ G => x|y|z|w \ S => dLb|s \ L => sL' \ L' => L|ε

; I => iESI'
(defun Ifn (str)
(print '( in Ifn)) (print str)
  (cond
    ((eql (car str) 'i) (Iprimefn (Sfn (Efn (cdr str)))))
    (t (append (cdr str) (list 'err)))))

; I' => eS|ε
(defun Iprimefn(str)
    (print '( in Iprimefn)) (print str)
  (cond
    ((null str) nil)
    ((eql (car str) 'e) (Sfn(cdr str)))
    (t (append (cdr str)(list 'err)))))

; E => GE'
(defun Efn (str)
  (print '( in Efn)) (print str)
  (let ((remaining (Gfn str)))
    (when remaining (Eprimefn remaining))))

; E' => oGE'|ε 
(defun Eprimefn (str)
  (print '( in Eprimefn)) (print str)
  (cond
    ((eql (car str) 'o)
     (let ((remaining (Gfn (cdr str))))
       (when remaining (Eprimefn remaining))))
    (t str)))

; G => x|y|z|w
(defun Gfn(str)
   (print '( in Gfn)) (print str)
 (cond
   ((eql (car str) 'x) (cdr str))
   ((eql (car str) 'y) (cdr str))
   ((eql (car str) 'z) (cdr str))
   ((eql (car str) 'w) (cdr str))
   (t (append (cdr str)(list 'err)))))


; S => dLb|s
(defun Sfn (str)
  (print '( in Sfn)) (print str)
  (cond
    ((eql (car str) 's) (cdr str))
    ((eql (car str) 'd)
     (let ((remaining (Lfn (cdr str))))
       (when remaining (if (and remaining (eql (car remaining) 'b)) (cdr remaining) 
        (append remaining '(err))))))
    (t (append str '(err)))))

; L => sL'
(defun Lfn(str)
  (print '( in Lfn)) (print str)
(cond 
    ((eql (car str) 's) (Lprimefn(cdr str)))
    (t str)))

; L' => L|ε 
(defun Lprimefn(str)
  (print '( in Lprimefn)) (print str)
 (cond
    ((eql (car str) nil) nil)
    (t (Lfn str))))