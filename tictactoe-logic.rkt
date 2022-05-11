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

;; Funciones para tratamiento de listas

(define (length? list)
  (cond ((null? list)
         0)
        (else
         (+ 1 (length? (cdr list))))))

(define (exist? value list)
  (cond ((null? list)
         #f)
        ((equal? (car list) value)
         #t)
        (else
         (exist? value (cdr list)))))
;;___________________________________________________________________________

;; Funcion de seleccion de una casilla
;; matrix: La matriz sobre la que se selecciona.
;; turn: simbolo que se inserta (0 para O y 1 para X)
;; i: fila elegida.
;; j: columna elegida. 
(define (selection matrix turn i j)
  (cond ((= i 1)
         (selection-aux (car matrix) turn j))
        (else
          (selection (cdr matrix) (- i 1) j))))

(define (selection-aux list turn j)
  (cond ((and (= j 1) (equal? turn 0)) 
         (car list))
        ((and (= j 1) (equal? turn 1))
         (car list))
        (else
         (selection-aux (cdr list) (- j 1)))))
;;____________________________________________________________________________

;; Algoritmo voraz de seleccion de la maquina.
;; matrix: La matriz sobre la que se selecciona
(define (greedy-bot-selection matrix)
  (selection matrix 0 (greedy-row matrix 1) (greedy-column matrix)))

;; Funcion que retorna las coordenadas i,j mas cercanas a un valor dentro de la matriz.
(define (greedy-algorithm-coords matrix)
  (list (greedy-row matrix 1) (greedy-column matrix)))

;; Funcion voraz para elegir la fila.
;; val: valor de retorno (0 para retornar la fila escogida y 1 para retornar el numero de fila) 
(define (greedy-row matrix val)
  (greedy-row-comp matrix val 1))

;; Funcion complementaria de greedy-row
;; counter: parametro que guarda el numero de fila actual.
(define (greedy-row-comp matrix val counter)
  (cond ((null? matrix)
         0)
        ((or (exist? 0 (car matrix))(exist? 1 (car matrix)))
         (cond ((= val 0)
                (car matrix))
               ((= val 1)
                counter)))
        (else
         (greedy-row-comp (cdr matrix) val (+ counter 1)))))

;; Funcion voraz para elegir la columna luego de elegir la fila.
;; matrix: La matriz sobre la que se selecciona
(define (greedy-column matrix)
  (greedy-column-comp (greedy-row matrix 0) 1))

;; Funcion complementaria de greedy-column.
;; row: fila escogida por el algoritmo voraz.
;; counter: parametro que guarda el numero de columna actual.
(define (greedy-column-comp row counter)
  (cond ((null? row)
         0)
        ((or (equal? (car row) 0) (equal? (car row) 1))
         (+ counter 1))
        ((or (equal? (cadr row) 0) (equal? (cadr row) 1))
         counter)
        (else
         (greedy-column-comp (cdr row) (+ counter 1)))))