#lang racket
;;Funcion para iniciar el juego Tic Tac Toe
(define (TTT rows columns)
  (cond ((and (>= rows 3) (>= columns 3) (<= rows 10) (<= columns 10))
        (+ 8 6))))

(define (build-matrix matrix rows columns)
  (cond ((= (length? matrix) rows)
         matrix)
        ( else
          ;;(insert-row matrix columns)
          (build-matrix matrix rows columns))))

(define (length? list)
  (cond ((null? list)
         0)
        (else
         (+ 1 (length? (cdr list))))))


        
         
        

  