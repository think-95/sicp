;;; generate random value between low and high
(define (random-in-range low high)
  (let ((range (- high low)))
	(+ low (random range))))
(random-in-range 1 10)

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1) (+ trials-passed 1)))
	  (else
	   (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (square x)
  (* x x))
(define (<= x y)
  (or (< x y) (= x y))) 

;;; x1<x2 && y1<y2
(define (P x1 x2 y1 y2)
  (let ((point-x (random-in-range x1 x2))
	(point-y (random-in-range y1 y2)))
    (<= (+ (square (- point-x 5)) (square (- point-y 7))) 9)))

(define (estimate-integral P x1 x2 y1 y2 number)
  (define (experiment)
    (P x1 x2 y1 y2))
  (let ((area (* (- x2 x1) (- y2 y1))))
    (* (monte-carlo number experiment ) area)))
(estimate-integral P 2 8 4 10 20)
  
