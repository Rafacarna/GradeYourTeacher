;;Grade Your Teacher
;;teacher.rkt
;;Edited by Rafael Carnaval Amaral BrT Saturday 19:55 P.M.

#lang racket

(require db)

(define pgc
  (sqlite3-connect #:database "./gradeteacher.db")) ; Connect in the db
  

(define (uni nam) ;Add an university in the database , using autoincrement
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
  (query-exec pgc "INSERT INTO University(Name) VALUES ($1)" nam) ;Name column which saves the information above
    (displayln nam)
    (disconnect pgc))) ; Disconnect from db

(define (area maj) ; add a major in the db , also using autoincrement
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
  (query-exec pgc "INSERT INTO Area(Major) VALUES ($1)" maj) ; Major saves the information
    (displayln maj)
    (disconnect pgc)))

(define (teacher n cla) ; Add a name fora a teacher and the class he gives
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
  (query-exec pgc "INSERT INTO Teachers(Name , Class)  
                   VALUES ($1 , $2)" n cla) ;Saving the values above
    (displayln n)
    (displayln cla)
    (disconnect pgc)))

(define (grade note comm); Add the note for the teacher
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
  (query-exec pgc "INSERT INTO Grade(Note , Commentary ) 
                   VALUES ($1 , $2)" note comm) ;Save the note and the commentary
    (displayln note)
    (displayln comm)
    (disconnect pgc)))

(define (rem r) ; Remove from University
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
    (query-exec pgc "DELETE FROM University WHERE id = ?" r)
    (disconnect pgc)))

(define (rem2 r) ; Remove from Area
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
    (query-exec pgc "DELETE FROM Area WHERE id = ?" r)
    (disconnect pgc)))

(define (rem3 r) ; Remove from Teachers
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
    (query-exec pgc "DELETE FROM Teachers WHERE id = ?" r)
    (disconnect pgc)))


(define (main) ; The menu for the user
  (displayln "GRADE YOUR TEACHER !!

            (show 1)- To show the name of the Universities!
            (uni name)- To add universities
            (rem id)- To remove the university
            (show 2)- To show the majors!
            (area name)- To add a major
            (rem2 id)- To remove a major
            (show 3)- To show the teachers!
            (teacher name class)- To add a teacher!
            (rem3 id)- To remove a teacher
            (show 4)- To show all notes and commentaries
            (grade note commentary)- To add a note and a comemtary"))

(define (show key) ; Define for a interectable menu
  (cond [(eq? key 1) (displayln (query-rows pgc "SELECT * FROM University"))]
        [(eq? key 2) (displayln (query-rows pgc "SELECT * FROM Area"))]
        [(eq? key 3) (displayln (query-rows pgc "SELECT * FROM Teachers"))]
        [(eq? key 4) (displayln (query-rows pgc "SELECT * FROM Grade"))]
        [else key])
  (main)) ; Show the menu after a function

(main) ; Shows the menu from beggining
