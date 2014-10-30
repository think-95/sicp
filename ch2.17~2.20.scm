;;;2.17
(define (last-pair list1)
  (if (null? (cdr list1))
      list1
      (last-pair (cdr list1))))
(last-pair (list 23 72 149 34))
;;;2.18
(define (reverse list1)
  (if (null? (cdr list1))
      list1
      (reverse (cdr list1)))
  (car list1))
(reverse (list 1 4 9 16 25))
;;;2.19
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else (+ (cc amount (except-first-denomination coin-values))
		 (cc (- amount (first-denomination coin-values)) coin-values)))))
(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))
(cc 5 us-coins)
;;;2.20
(define (even? n)
  (= (remainder n 2) 0))
(define (get-odd values)
  (if (not (null? values))
  (let ((value (car values)))
  (if (not (even? value))
      (cons value (get-odd (cdr values)))
      (get-odd (cdr values))))))
(define (get-even values)
  (if (not (null? values))
  (let ((value (car values)))
  (if (even? value)
      (cons value (get-even (cdr values)))
      (get-even (cdr values))))))
(define (same-parity . values)
  (if (even? (car values))
      (get-even values)
      (get-odd values)))
(same-parity  2 3 4 5 6 7 8)

      
  

