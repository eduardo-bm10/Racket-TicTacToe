#lang racket/gui
(require racket/gui/base)
(require "tictactoe-logic.rkt")

;---------------------------INTERFAZ GRÁFICA VENTANA 1-------------------------------
;Crea la ventana de inicio
(define frame1 (new frame%
                   [label "TicTacToe Inicio"]
                   [width 500]
                   [height 500]))


(new message%[parent frame1][label "Escoja el tamaño de la matriz"] )

;Crea los espacios de entrada de texto
(define col_entry (new text-field% [label "Columnas"] [parent frame1]))
(define row_entry (new text-field% [label "Filas         "] [parent frame1]))

;Llamada de acción del botón "check"
(define (button-callback b e)
    (let ((cols (send col_entry get-value))(rows(send row_entry get-value)))
      
      (cond
        [(> ( string->number cols)  10 ) (new message% [parent frame1][label "La cantidad de columnas debe ser máximo 10"] )]
        [(> ( string->number rows)  10)  (new message%[parent frame1][label "La cantidad de filas debe ser máximo 10"])]
        [else (Gridcreator ( string->number rows)  ( string->number cols) 1 1)]

      ) ))
      
;Crea el botón check    
(new button% [label "Check"]
    [parent frame1]
    [callback button-callback])

;Muestra la ventana de inicio
(send frame1 show #t)


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
(send frame show #t)
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
