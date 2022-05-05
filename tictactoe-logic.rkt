#lang racket

;;Funcion para iniciar el juego Tic Tac Toe

(define (TTT rows columns)
  (cond ((and (>= rows 3) (>= columns 3) (<= rows 10) (<= columns 10))
        (build-matrix '() rows columns))))

;;________________________________________________________________________

;; Funciones para armar una matrix rxc:
;; build-matrix: funcion principal inserta filas dentro de una lista.
;; build-matrix-aux: Funcion auxiliar inserta columnas dentro de una fila.

(define (build-matrix matrix r c)
  (cond ((= (length? matrix) r)
         matrix)
        ( else
          (build-matrix (cons (build-matrix-aux '() c) matrix) r c))))

(define (build-matrix-aux r c)
  (cond ((= (length? r) c)
         r)
        ( else
          (build-matrix-aux (cons '() r) c))))
;;__________________________________________________________________________

(define (length? list)
  (cond ((null? list)
         0)
        (else
         (+ 1 (length? (cdr list))))))

(define (value? list pos)
  (cond ((= pos (- (length? list) (- (length? list) 1)))
         (car list))
        ( else
          1)))

(define (player-selection i j)
  (cond ((= (length? '(1 2 3 4)) i)
         (value? '(1 2 3 4) i))))
  

        
         
        

  