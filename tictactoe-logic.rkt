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

(define (get-value matrix ij i j)
  (cond ((= i (car ij))
         (get-value-aux (car matrix) ij j))
        (else
         (get-value (cdr matrix) ij (+ i 1) j))))

(define (get-value-aux row ij j)
  (cond ((= j (cadr ij))
         (car row))
        (else
         (get-value-aux (cdr row) ij (+ j 1)))))
         

;; Funcion ramdon para elegir 8 posibles lugares alrededor de X o O.
(define (ran-num)
  (cond ((equal? (random 7) 0)
         0)
        ((equal? (random 7) 1)
         1)
        ((equal? (random 7) 2)
         2)
        ((equal? (random 7) 3)
         3)
        ((equal? (random 7) 4)
         4)
        ((equal? (random 7) 5)
         5)
        ((equal? (random 7) 6)
         6)
        ((equal? (random 7) 7)
         7)
        (else
         (ran-num))))
        
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
(define (bot-greedy-algorithm matrix)
  (greedy-algorithm-selection (greedy-algorithm-candidates matrix)))

;; Funcion que retorna una lista con todas las posiciones vecinas de la marca X o O.
(define (greedy-algorithm-candidates matrix)
  (candidates-filter1 (list (list (- (greedy-row matrix 1) 1) (- (greedy-column matrix) 1))
        (list (- (greedy-row matrix 1) 1) (greedy-column matrix))
        (list (- (greedy-row matrix 1) 1) (+ (greedy-column matrix) 1))
        (list (greedy-row matrix 1) (- (greedy-column matrix) 1))
        (list (greedy-row matrix 1) (+ (greedy-column matrix) 1))
        (list (+ (greedy-row matrix 1) 1) (- (greedy-column matrix) 1))
        (list (+ (greedy-row matrix 1) 1) (greedy-column matrix))
        (list (+ (greedy-row matrix 1) 1) (+ (greedy-column matrix) 1))) '() matrix))

(define (candidates-filter1 list finalList matrix)
  (cond ((null? list)
         (candidates-filter2 matrix finalList '()))
        ((and (not (zero? (caar list))) (not (zero? (cadar list))))
         (candidates-filter1 (cdr list) (cons (car list) finalList) matrix))
        (else
         (candidates-filter1 (cdr list) finalList matrix))))

(define (candidates-filter2 matrix list finalList)
  (cond ((null? list)
         finalList)
        ((equal? (get-value matrix (car list) 1 1) '())
         (candidates-filter2 matrix (cdr list) (cons (car list) finalList)))
        (else
         (candidates-filter2 matrix (cdr list) finalList))))

;; Funcion que escoge aleatoriamente uno de los candidatos encontrados.
(define (greedy-algorithm-selection candidates)
  (cond ((= (ran-num) 0)
         (first candidates))
        ((= (ran-num) 1)
         (second candidates))
        ((= (ran-num) 2)
         (third candidates))
        ((= (ran-num) 3)
         (fourth candidates))
        ((= (ran-num) 4)
         (fifth candidates))
        ((= (ran-num) 5)
         (sixth candidates))
        ((= (ran-num) 6)
         (seventh candidates))
        (else
         (eighth candidates))))
  
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
         counter)
        (else
         (greedy-column-comp (cdr row) (+ counter 1)))))