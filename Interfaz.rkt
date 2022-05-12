#lang racket/gui
(require racket/gui/base)
(require racket/format)

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



