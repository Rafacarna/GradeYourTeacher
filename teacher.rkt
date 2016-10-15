#lang racket

(require db)
(require 2htdp/universe 2htdp/image)

(define pgc
  (sqlite3-connect #:database "/home/rafacarna/GradeYourTeacher/grade.db"))
  

(define (facul x nom)
  (let* ([pgc (sqlite3-connect #:database "/home/rafacarna/GradeYourTeacher/grade.db")])
  (query-exec pgc "INSERT INTO Faculdades(id , Nome) VALUES ($1, $2)" x nom) ;Faculdades = Univesities , Nome = Name
    (displayln nom)
    (disconnect pgc)))

(define (area a coor)
  (let* ([pgc (sqlite3-connect #:database "/home/rafacarna/GradeYourTeacher/grade.db")])
  (query-exec pgc "INSERT INTO Area(id , Coordenacao) VALUES ($1 , $2)" a coor) ; Coordenacao = Major
    (displayln coor)
    (disconnect pgc)))

(define (prof id n m)
  (let* ([pgc (sqlite3-connect #:database "/home/rafacarna/GradeYourTeacher/grade.db")])
  (query-exec pgc "INSERT INTO Professores(id , Nome , Materia)  
                   VALUES ($1 , $2 , $3)" id n m) ; Professores = Teachers , Materia = 
    (displayln n)
    (displayln m)
    (disconnect pgc)))

(define (avali nota com)
  (let* ([pgc (sqlite3-connect #:database "/home/rafacarna/GradeYourTeacher/grade.db")])
  (query-exec pgc "INSERT INTO Avaliacao(Nota , Comentario ) 
                   VALUES ($1 , $2)" nota com) ; Comentario = Commentary , Avaliacao = 
    (displayln nota)
    (displayln com)
    (disconnect pgc)))

(define (rem r)
  (let* ([pgc (sqlite3-connect #:database "/home/rafacarna/GradeYourTeacher/grade.db")])
    (query-exec pgc "DELETE FROM Faculdades WHERE id = ?" r)
    (disconnect pgc)))

(define (rem2 r)
  (let* ([pgc (sqlite3-connect #:database "/home/rafacarna/GradeYourTeacher/grade.db")])
    (query-exec pgc "DELETE FROM Area WHERE id = ?" r)
    (disconnect pgc)))

(define (rem3 r)
  (let* ([pgc (sqlite3-connect #:database "/home/rafacarna/GradeYourTeacher/grade.db")])
    (query-exec pgc "DELETE FROM Professores WHERE id = ?" r)
    (disconnect pgc)))



(displayln "GRADE YOUR TEACHER !!

            1- To show the name of the Universities!
             *To add universities type 'facul' the id and the name
             *To remove type 'rem' and the id
            2- To show the majors!
             *To add a major type 'area' the id and the name
             *To remove type 'rem2' and the id
            3- To show the teachers!
             *To add a teacher type 'prof' the id the name and the 
             *To remove type 'rem3' and the id
            4- To show all notes and commentaries
             *To add a note and a comemtary type 'avali' the note and the commentary")

(define (menu key)
  (cond [(eq? key 1) (displayln (query-rows pgc "SELECT * FROM Faculdades"))]
        [(eq? key 2) (displayln (query-rows pgc "SELECT * FROM Area"))]
        [(eq? key 3) (displayln (query-rows pgc "SELECT * FROM Professores"))]
        [(eq? key 4) (displayln (query-rows pgc "SELECT * FROM Avaliacao"))]
        [else key]))

