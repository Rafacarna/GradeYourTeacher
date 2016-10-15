#lang racket

(require db)
(require 2htdp/universe 2htdp/image)

(define pgc
  (sqlite3-connect #:database "./gradeteacher.db"))
  

(define (uni nam)
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
  (query-exec pgc "INSERT INTO University(Name) VALUES ($1)" nam)
    (displayln nam)
    (disconnect pgc)))

(define (area maj)
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
  (query-exec pgc "INSERT INTO Area(Major) VALUES ($1)" maj) 
    (displayln maj)
    (disconnect pgc)))

(define (teacher n cla)
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
  (query-exec pgc "INSERT INTO Teachers(Name , Class)  
                   VALUES ($1 , $2)" n cla)
    (displayln n)
    (displayln cla)
    (disconnect pgc)))

(define (grade note comm)
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
  (query-exec pgc "INSERT INTO Grade(Note , Commentary ) 
                   VALUES ($1 , $2)" note comm) 
    (displayln note)
    (displayln comm)
    (disconnect pgc)))

(define (rem r)
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
    (query-exec pgc "DELETE FROM University WHERE id = ?" r)
    (disconnect pgc)))

(define (rem2 r)
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
    (query-exec pgc "DELETE FROM Area WHERE id = ?" r)
    (disconnect pgc)))

(define (rem3 r)
  (let* ([pgc (sqlite3-connect #:database "./gradeteacher.db")])
    (query-exec pgc "DELETE FROM Teachers WHERE id = ?" r)
    (disconnect pgc)))


(define (main)
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

(define (show key)
  (cond [(eq? key 1) (displayln (query-rows pgc "SELECT * FROM University"))]
        [(eq? key 2) (displayln (query-rows pgc "SELECT * FROM Area"))]
        [(eq? key 3) (displayln (query-rows pgc "SELECT * FROM Teachers"))]
        [(eq? key 4) (displayln (query-rows pgc "SELECT * FROM Grade"))]
        [else key])
  (main))

(main)
