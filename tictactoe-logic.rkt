#lang racket/gui
(require racket/gui/base)
(require racket/format)


;---------------------------INTERFAZ GRÁFICA-------------------------------

;Creación Window
(define frame (new frame% [label "Tarea 1"]))

; Make a static text message in the frame
(define msg (new message% [parent frame]
                          [label "       "]))

;Creación de los containers de los botones para el grid
(define vpanel (new vertical-panel% [parent frame]))
(define hpanel1 (new horizontal-panel% [parent vpanel]))
(define hpanel2 (new horizontal-panel% [parent vpanel]))
(define hpanel3 (new horizontal-panel% [parent vpanel]))
(define hpanel4 (new horizontal-panel% [parent vpanel]))
(define hpanel5 (new horizontal-panel% [parent vpanel]))
(define hpanel6 (new horizontal-panel% [parent vpanel]))
(define hpanel7 (new horizontal-panel% [parent vpanel]))
(define hpanel8 (new horizontal-panel% [parent vpanel]))
(define hpanel9 (new horizontal-panel% [parent vpanel]))
(define hpanel10 (new horizontal-panel% [parent vpanel]))

;Contendrá los botones en una matriz para cambiar sus configuraciones
(define Matriz '())
(define FilaMatriz '())
(define MatrizBotones '())
(define FilaBotones '())



;Deshabilita un botón que el CPU haya elegido y lo marca
(define (SelectedCPU  fila columna matriz)
  (send (list-ref (list-ref MatrizBotones fila) columna) set-label "O")
  (send (list-ref (list-ref MatrizBotones fila) columna) enable #f)
  (set! Matriz matriz)
)


;Crea el grid
(define (Gridcreator Fila Columna Filaaux Columnaaux)
  (cond [(equal?  Filaaux (+ Fila 1))];Se generaron todas las filas
        
        [(equal? Columnaaux (+ Columna 1));Se generaron todas las columnas de una fila
         (set! MatrizBotones (append MatrizBotones (list FilaBotones)))
         (set! FilaBotones '())
         (set! Matriz (append Matriz (list FilaMatriz)))
         (set! FilaMatriz '())
         (Gridcreator Fila Columna (+ Filaaux 1) 1)]
        
        [(equal? Filaaux 1);Primera fila va en el primer hpanel
         
         (define NewButton(new button% [parent hpanel1]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]
        
        [(equal? Filaaux 2);Segunda fila va en el segundo hpanel
         
         (define NewButton(new button% [parent hpanel2]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]
        
        [(equal? Filaaux 3);Tercera fila va en el tercer hpanel

         (define NewButton(new button% [parent hpanel3]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]

        [(equal? Filaaux 4);Cuarta fila va en el cuarto hpanel
         
         (define NewButton(new button% [parent hpanel4]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]
        
        [(equal? Filaaux 5);Quinta fila va en el quinto hpanel
         
         (define NewButton(new button% [parent hpanel5]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]
        
        [(equal? Filaaux 6);Sexta fila va en el sexto hpanel
         (define NewButton(new button% [parent hpanel6]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]
        
        [(equal? Filaaux 7);Séptima fila va en el séptimo hpanel
         (define NewButton(new button% [parent hpanel7]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]
        
        [(equal? Filaaux 8);Octava fila va en el octavo hpanel
         
         (define NewButton(new button% [parent hpanel8]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]
        
        [(equal? Filaaux 9);Novena fila va en el noveno hpanel
         
         (define NewButton(new button% [parent hpanel9]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]
        
        [(equal? Filaaux 10);Décima fila va en el décimo hpanel
         
         (define NewButton(new button% [parent hpanel10]
             [label "-"]
             [callback (lambda (button event)
                         (send button set-label "X")
                         (send button enable #f)
                         (Adminuser (Changeelement '() Matriz (- Filaaux 1) (- Columnaaux 1) 1)))]))
         (set! FilaBotones (append FilaBotones (list NewButton)))
         (set! FilaMatriz (append FilaMatriz (list '())))
         (Gridcreator Fila Columna Filaaux (+ Columnaaux 1))]
  )
 )


(define (Winner Status)
  (send frame delete-child vpanel)
  (cond [(equal? Status 1)
         (new message% [parent frame]
                       [label "Ganaste!!"])]
        [(equal? Status 0)
         (new message% [parent frame]
                       [label "Perdiste!!"])]
        [(equal? Status 2)
          (new message% [parent frame]
                       [label "Empate!!"])]
        )
  )                      
         
   


(Gridcreator 3 3 1 1)


;---------------------------ADMINISTRADOR TICTACTOE-------------------------

;Función revisa constantemente terminación ´del usuario 
(define(Adminuser matriz)
  (cond[(Fin? (cdr matriz) (car matriz) 0 1)
        (Winner 1)]
       [(Empate? matriz) (Winner 2) ]
       [else (AdminCPU matriz (greedy-algorithm-coords matriz))]))

;Función que revisa constantemente terminación del CPU
(define (AdminCPU matriz coords)
  (SelectedCPU (car coords) (cadr coords) (Changeelement '() matriz (car coords) (cadr coords) 0))
  (CPUfinish? (Changeelement '() matriz (car coords) (cadr coords) 0) )
)

(define (CPUfinish? matriz)
  (cond [(Fin? (cdr matriz) (car matriz) 0 0)
         (Winner 0)]
        [(Empate? matriz) (Winner 2)]
   )
 )


;Función para el fin del juego
(define(Fin? matriz Fila Columna Jugador)
  (cond [(null? matriz) #f];Explorada toda la matriz
        [(null? Fila) (Fin? (cdr matriz) (car matriz) 0 Jugador)];Explorada toda la fila
        [(equal? (car Fila) Jugador);Encuentra ficha del jugador
         (cond [(Columnas? matriz Columna Jugador 1) #t];Revisa si los proximos 2 en fila son del jugador
               [(Filas? (cdr Fila) Jugador 1) #t] ;Revisa si los proximos 2 en columna son del jugador
               [(DiagonalD? matriz (+ Columna 1) Jugador 1 (length (car matriz))) #t];Revisa si los proximos 2 en diagonal derecha son del jugador
               [(DiagonalI? matriz (- Columna 1) Jugador 1) #t];Revisa si los proximos 2 en diagonal izquierda son del jugador
               [else (Fin? matriz (cdr Fila) (+ Columna 1) Jugador)];No encuentra continúa buscando la próxima ficha del jugador
          )]
        [else (Fin? matriz (cdr Fila) (+ Columna 1) Jugador)];La ficha no es del jugador continúa
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
(define (Columnas? matriz Columna Jugador Gane)
  (cond [(equal? Gane 3) #t];Tres en fila en columna
        [(null? matriz) #f];Todas las filas revisadas
        [(equal? Jugador (list-ref (car matriz) Columna)) (Columnas? (cdr matriz) Columna Jugador (+ Gane 1))];La ficha es del jugador se sigue buscando
        [else #f];No es del jugador e ignora el caso
   )
)

;Función que busca 3 en diagonal dirección derecha
(define(DiagonalD? matriz Columna Jugador Gane Size)
  (cond [(equal? Gane 3) #t];tres en fila diagonal derecha
        [(null? matriz) #f];Se recorrió la matriz
        [(equal? Columna Size) #f];Out of bounds
        [(equal? Jugador (list-ref (car matriz) Columna)) (DiagonalD? (cdr matriz) (+ Columna 1) Jugador (+ Gane 1) Size) ];Es ficha del jugador se continúa evaluando
        [else #f];No es fucha se ignora el caso
        )
 )

;Función que busca 3 en diagonal dirección izquierda
(define(DiagonalI? matriz Columna Jugador Gane)
  (cond [(equal? Gane 3) #t];tres en fila diagonal izquierda
        [(null? matriz) #f];se recorrió la matriz
        [(equal? Columna -1) #f];out of bounds
        [(equal? Jugador (list-ref (car matriz) Columna)) (DiagonalI? (cdr matriz) (- Columna 1) Jugador (+ Gane 1)) ];Se encontró ficha del jugador, se sigue buscando
        [else #f];No es ficha se ignora el caso
        )
 )

(define(list-ref List Position)
  (cond [(equal? Position 0) (car List)]
        [else (list-ref (cdr List) (- Position 1))]
   )
)

;Función para revisar el caso de empate cada fila
(define (Empate? matriz)
  (cond [(null? matriz) #t]
        [(Empateaux? (car matriz)) #f]
        [else (Empate? (cdr matriz))]
   )
)

;Función auxiliar para revisar el caso de empate cada elemento de la fila
(define (Empateaux? Fila)
  (cond [(null? Fila) #f]
        [(null? (car Fila)) #t]
        [else (Empateaux? (cdr Fila))]
   )
)

;Función que devuelve el último elemento
(define (Lastelement List)
  (cond [(equal? (length List) 1) (car List)]
        [else (Lastelement (cdr List))]
  )
)

;Función que devuelve una matriz con el elemento i,j cambiado
(define (Changeelement Cambiomatriz matriz Fila Columna Valor)
  (cond [(null? matriz) Cambiomatriz]
        [(equal? Fila 0)
         (Changeelement  (append Cambiomatriz (list (Changeelementaux (car matriz) '() Columna Valor))) (cdr matriz) (- Fila 1) (- Columna 1) Valor)
        ]
        [else (Changeelement (append Cambiomatriz (list (car matriz))) (cdr matriz) (- Fila 1) Columna Valor)]
   )
)

;Auxiliar de función para elemento cambiado
(define (Changeelementaux Lista ListaRes Posicion Elemento)
  (cond [(null? Lista) ListaRes]
        [(equal? Posicion 0) (Changeelementaux (cdr Lista) (append ListaRes (list Elemento)) (- Posicion 1) Elemento)]
        [else (Changeelementaux (cdr Lista) (append ListaRes (list (car Lista))) (- Posicion 1) Elemento)]
   )
 )

;-------------------------------------GREEDY ALGORITHM------------------------------------------
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

; Show the frame by calling its show method
(send frame show #t)
