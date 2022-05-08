#lang racket
;Función revisa constantemente terminación y pide posiciones
(define(Admin Matriz Jugador)
  (cond[(Fin? (cdr Matriz) (car Matriz) 0 Jugador) Jugador]
       [(Empate? Matriz) 3 ]
       [(equal? Jugador 1);fin turno usuario 
        (Admin  0)]      ;falta función pedir matriz a CPU
       [(equal? Jugador 0);fin turno CPU
        (Admin  1)];falta función pedir matriz a intefaz
     )
    )

;Función para pruebas
(define(Finaux Matriz Jugador)
  (Fin? (cdr Matriz) (car Matriz) 0 Jugador)
  )

;Función para el fin del juego
(define(Fin? Matriz Fila Columna Jugador)
  (cond [(null? Matriz) #f];Explorada toda la matriz
        [(null? Fila) (Fin? (cdr Matriz) (car Matriz) 0 Jugador)];Explorada toda la fila
        [(equal? (car Fila) Jugador);Encuentra ficha del jugador
         (cond [(Columnas? Matriz Columna Jugador 1) #t];Revisa si los proximos 2 en fila son del jugador
               [(Filas? (cdr Fila) Jugador 1) #t] ;Revisa si los proximos 2 en columna son del jugador
               [(DiagonalD? Matriz (+ Columna 1) Jugador 1 (length (car Matriz))) #t];Revisa si los proximos 2 en diagonal derecha son del jugador
               [(DiagonalI? Matriz (- Columna 1) Jugador 1) #t];Revisa si los proximos 2 en diagonal izquierda son del jugador
               [else (Fin? Matriz (cdr Fila) (+ Columna 1) Jugador)];No encuentra continúa buscando la próxima ficha del jugador
          )]
        [else (Fin? Matriz (cdr Fila) (+ Columna 1) Jugador)];La ficha no es del jugador continúa
 )
 )


;Función auxiliar busqueda 3 en fila
(define(Filas? Fila Jugador Gane)
  (cond [(equal? Gane 3) #t];tres en fila
        [(null? Fila) #f];Se recorrió la fila
        [(equal? (car Fila) Jugador) (Filas? (cdr Fila) Jugador (+ Gane 1))];Se encontró la ficha del jugador se continúa evaluando
        [else #f];No es ficha del jugador, se ignora el caso
   )
)

;Función que busca 3 en columnas
(define (Columnas? Matriz Columna Jugador Gane)
  (cond [(equal? Gane 3) #t];Tres en fila en columna
        [(null? Matriz) #f];Todas las filas revisadas
        [(equal? Jugador (list-ref (car Matriz) Columna)) (Columnas? (cdr Matriz) Columna Jugador (+ Gane 1))];La ficha es del jugador se sigue buscando
        [else #f];No es del jugador e ignora el caso
   )
)

;Función que busca 3 en diagonal dirección derecha
(define(DiagonalD? Matriz Columna Jugador Gane Size)
  (cond [(equal? Gane 3) #t];tres en fila diagonal derecha
        [(null? Matriz) #f];Se recorrió la matriz
        [(equal? Columna Size) #f];Out of bounds
        [(equal? Jugador (list-ref (car Matriz) Columna)) (DiagonalD? (cdr Matriz) (+ Columna 1) Jugador (+ Gane 1) Size) ];Es ficha del jugador se continúa evaluando
        [else #f];No es fucha se ignora el caso
        )
 )

;Función que busca 3 en diagonal dirección izquierda
(define(DiagonalI? Matriz Columna Jugador Gane)
  (cond [(equal? Gane 3) #t];tres en fila diagonal izquierda
        [(null? Matriz) #f];se recorrió la matriz
        [(equal? Columna -1) #f];out of bounds
        [(equal? Jugador (list-ref (car Matriz) Columna)) (DiagonalI? (cdr Matriz) (- Columna 1) Jugador (+ Gane 1)) ];Se encontró ficha del jugador, se sigue buscando
        [else #f];No es ficha se ignora el caso
        )
 )

(define(list-ref List Position)
  (cond [(equal? Position 0) (car List)]
        [else (list-ref (cdr List) (- Position 1))]
   )
)

;Función para revisar el caso de empate cada fila
(define (Empate? Matriz)
  (cond [(null? Matriz) #t]
        [(Empateaux? (car Matriz)) #f]
        [else (Empate? (cdr Matriz))]
   )
)

;Función auxiliar para revisar el caso de empate cada elemento de la fila
(define (Empateaux? Fila)
  (cond [(null? Fila) #f]
        [(null? (car Fila)) #t]
        [else (Empateaux? (cdr Fila))]
   )
)