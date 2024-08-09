;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |HW-6 Frogger 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; A Player is a (make-player Number Number image)
(define-struct player (x y i))
;;where x is the x position of the player, y is the y position
;of the player and i is the image of the player

;player-temp: player -> ?
(define (player-temp p)
  (...
   ... (player-x) ...
   ... (player-y) ...
   ... (player-i) ...))

;; A turtle is a (make-turtle Number Number Number))
(define-struct turtle (x y dir))
;where x is the x position of the turtle and y is the y position
;of the turtle and dir is the direction of the turtle

(define (turtle-temp p)
  (...
   ... (turtle-x) ...
   ... (turtle-y) ...
   ... (turtle-dir) ...))

;; A Set of Turtles (tSet) is a list of Vehicle
;;-'()
;;-(cons turtle turtles)
;;Interpretation- contains a list of all the turtles in the game

;; turtles-temp: tSet -> ?
(define (turtles-temp t)
  (...
   (cond [(empty? t) ...]
         [(cons? t) ... (turtle-temp (first t)) ...
                    ... (turtles-temp (rest t)) ...] ...)))

;; A log is a (make-log Number Number Number))
(define-struct Log (x y dir))
;where x is the x position of the turtle and y is the y position
;of the turtle and dir is the direction of the turtle

(define (log-temp p)
  (...
   ... (log-x) ...
   ... (log-y) ...
   ... (log-dir) ...))


;; A Set of Logs (lSet) is a list of Vehicle
;;-'()
;;-(cons log logs)
;;Interpretation- contains a list of all the logs in the game

;; turtles-temp: tSet -> ?
(define (logs-temp l)
  (...
   (cond [(empty? l) ...]
         [(cons? l) ... (log-temp (first l)) ...
                    ... (logs-temp (rest l)) ...] ...)))



;; A Vehicle is a (make-vehicle Number Number Number))
(define-struct vehicle (x y dir))
;where x is the x position of the vehicle, y is the y position
;of the vehicle and dir is the direction of the vehicle where
;-1 is to the left and +1 is to the right

;vehicle-temp: vehicle -> ?
(define (vehicle-temp p)
  (...
   ... (vehicle-x) ...
   ... (vehicle-y) ...
   ... (vehicle-dir) ...))

;; A Set of Vehicles (VSet) is a list of Vehicle
;;-'()
;;-(cons vehicle vehicles)
;;Interpretation- contains a list of all the vehicles in the game

;; vehicles-temp: VSet -> ?
(define (vehicles-temp v)
  (...
   (cond [(empty? v) ...]
         [(cons? v) ... (vehicle-temp (first v)) ...
                    ... (vehicles-temp (rest v)) ...] ...)))
;; A World is a (make-world Player VSet)
;; The VSet represents the set of vehicles moving across the screen
(define-struct world (player vehicles turtles Logs))

;world-temp: world -> ?
(define (world-temp w)
  (...
   (cond
     [(player? w) ... (player-temp (world-player))]
     [(vehicles? w) ... (vehicles-temp (world-vehicles))]
     [(turtle? w) ... (turtles-temp (world-turtles))]
     [(Log? w) ... (logs-temp (world-logs))] ...)))

;;A Set of Images (iset) is a list of images


;posn-temp: Position -> ?
(define (posn-temp p)
  (... (posn-x p) ...
       ... (posn-y p) ...))


;; constants

;vehicle images
(define v (rectangle 50 20 "solid" "red"))
(define v1 (rectangle 50 20 "solid" "blue"))
(define v2 (rectangle 50 20 "solid" "yellow"))
(define v3 (rectangle 50 20 "solid" "purple"))
(define v4 (rectangle 50 20 "solid" "orange"))

;turtle image
(define t (square 50 "solid" "darkgreen"))


;log image
(define l (rectangle 80 50 "solid" "brown"))


;vehicles
(define v11 (make-vehicle 400 900 -1))
(define v12 (make-vehicle 300 900 -1))
(define v13 (make-vehicle 200 900 -1))
(define v14 (make-vehicle 100 900 -1))
(define v21 (make-vehicle 400 800 1))
(define v22 (make-vehicle 300 800 1))
(define v23 (make-vehicle 200 800 1))
(define v24 (make-vehicle 100 800 1))
(define v31 (make-vehicle 400 700 -1))
(define v32 (make-vehicle 300 700 -1))
(define v33 (make-vehicle 200 700 -1))
(define v34 (make-vehicle 100 700 -1))
(define v41 (make-vehicle 400 600 1))
(define v42 (make-vehicle 300 600 1))
(define v43 (make-vehicle 200 600 1))
(define v44 (make-vehicle 100 600 1))
(define v51 (make-vehicle 400 500 -1))
(define v52 (make-vehicle 300 500 -1))
(define v53 (make-vehicle 200 500 -1))
(define v54 (make-vehicle 100 500 -1))

;turtles
(define t11 (make-turtle 400 425 -1))
(define t12 (make-turtle 300 425 -1))
(define t13 (make-turtle 200 425 -1))
(define t14 (make-turtle 100 425 -1))
(define t21 (make-turtle 400 325 -1))
(define t22 (make-turtle 300 325 -1))
(define t23 (make-turtle 200 325 -1))
(define t24 (make-turtle 100 325 -1))
(define t31 (make-turtle 400 225 -1))
(define t32 (make-turtle 300 225 -1))
(define t33 (make-turtle 200 225 -1))
(define t34 (make-turtle 100 225 -1))
(define t41 (make-turtle 400 125 -1))
(define t42 (make-turtle 300 125 -1))
(define t43 (make-turtle 200 125 -1))
(define t44 (make-turtle 100 125 -1))

;logs
(define l11 (make-Log 400 375 1))
(define l12 (make-Log 200 375 1))
(define l21 (make-Log 400 275 1))
(define l22 (make-Log 200 275 1))
(define l31 (make-Log 400 175 1))
(define l32 (make-Log 200 175 1))


;turtle lists
(define tset (list t11 t12 t13 t14 t21 t22 t23 t24 t31 t32 t33 t34 t41 t42 t43 t44))
(define iset2 (list t t t t t t t t t t t t t t t t))


;log lists
(define lset (list l11 l12 l21 l22 l31 l32))
(define iset3 (list l l l l l l))



;vehicle lists
(define vset (list v11 v12 v13 v14 v21 v22 v23 v24 v31 v32 v33 v34 v41 v42 v43 v44 v51 v52 v53 v54))
(define iset (list v v v v v1 v1 v1 v1 v2 v2 v2 v2 v3 v3 v3 v3 v4 v4 v4 v4))

;background
(define bg (place-images
            (list (rectangle 400 100 "solid" "black")
                  (rectangle 400 100 "solid" "gray")
                  (rectangle 400 100 "solid" "black")
                  (rectangle 400 100 "solid" "gray")
                  (rectangle 400 100 "solid" "black")
                  (rectangle 400 100 "solid" "lightblue")
                  (rectangle 400 100 "solid" "lightblue")
                  (rectangle 400 100 "solid" "lightblue")
                  (rectangle 400 100 "solid" "lightblue")
                  (rectangle 400 50 "solid" "lightblue"))
            
            (list (make-posn 200 900)
                  (make-posn 200 800)
                  (make-posn 200 700)
                  (make-posn 200 600)
                  (make-posn 200 500)
                  (make-posn 200 400)
                  (make-posn 200 325)
                  (make-posn 200 250)
                  (make-posn 200 175)
                  (make-posn 200 125))
            (empty-scene 400 1000)))

;frog
(define frog (square 20 "solid" "green"))
(define head (square 10 "solid" "green"))
(define frogl (beside head frog))
(define frogr (beside frog head))
(define frogu (above head frog))
(define frogd (above frog head))
(define f1 (make-player 200 975 frogu))

(define loa (cons frog (cons iset2 iset3)))

;world
(define w1 (make-world f1 vset tset lset))

;; start: World -> World
;; start the game
(define (start w)
  (big-bang w
    [to-draw draw-world]
    [on-key move-frog]
    [on-tick move-all]
    [stop-when game-over?]))

;; draw-world: World -> Image
;; Draws the world
(check-expect (draw-world w1) (place-images
                               (append (cons frogu
                                             iset3) iset2 iset)
                               (append (cons (make-posn 200 975)
                                             (map Log-posn lset))
                                       (map turtle-posn tset)
                                       (map vehicle-posn vset))
                               bg))


(define (draw-world w)
  (place-images
   (append (cons (player-i (world-player w)) iset3) iset2 iset)
   (append (cons (make-posn (player-x (world-player w)) (player-y (world-player w)))
                 (map Log-posn (world-Logs w)))
           (map turtle-posn (world-turtles w))
           (map vehicle-posn (world-vehicles w)))
   bg))

;; Helper function to get the position of a vehicle
;; vehicle-posn: vehicle -> posn
;; takes in a vehicle and outputs the vehicles position
(check-expect (vehicle-posn v22) (make-posn 300 800))
(define (vehicle-posn v)
  (make-posn (vehicle-x v) (vehicle-y v)))

;; move-single-car: Vehicle -> Vehicle
;; Moves a single car
(check-expect (move-single-car v12) (make-vehicle 299 900 -1))
(check-expect (move-single-car (make-vehicle 402 550 1)) (make-vehicle 0 550 1))
(check-expect (move-single-car (make-vehicle -1 450 -1)) (make-vehicle 400 450 -1))
(define (move-single-car v)
  (if (> (+ (vehicle-x v) (vehicle-dir v)) 400)
      (make-vehicle 0 (vehicle-y v) (vehicle-dir v))
      (if (< (+ (vehicle-x v) (vehicle-dir v)) 0)
          (make-vehicle 400 (vehicle-y v) (vehicle-dir v))
          (make-vehicle (+ (vehicle-x v) (vehicle-dir v)) (vehicle-y v) (vehicle-dir v)))))

;; move-all: World -> World
;; Moves the player cars turtles and logs
(check-expect (move-all (make-world (make-player 300 400 frogu) vset tset lset))
              (make-world (make-player 299 400 frogu)
                          (map move-single-car vset)
                          (map move-single-turtle tset)
                          (map move-single-Log lset)))
(check-expect (move-all (make-world (make-player 200 375 frogu) vset tset lset))
              (make-world (make-player 201 375 frogu)
                          (map move-single-car vset)
                          (map move-single-turtle tset)
                          (map move-single-Log lset)))
                        
(check-expect (move-all w1) (make-world f1
                                        (map move-single-car vset)
                                        (map move-single-turtle tset)
                                        (map move-single-Log lset)))
(define (move-all w)
  (cond
    [(turtle-collides? w) (make-world (make-player (- (player-x (world-player w)) 1)
                                                   (player-y (world-player w))
                                                   (player-i (world-player w)))
                                      (map move-single-car (world-vehicles w))
                                      (map move-single-turtle (world-turtles w))
                                      (map move-single-Log (world-Logs w)))]
    [(log-collides? w)   (make-world (make-player (+ (player-x (world-player w)) 1)
                                                  (player-y (world-player w))
                                                  (player-i (world-player w)))
                                     (map move-single-car (world-vehicles w))
                                     (map move-single-turtle (world-turtles w))
                                     (map move-single-Log (world-Logs w)))]
    [else (make-world (world-player w) (map move-single-car (world-vehicles w))
                      (map move-single-turtle (world-turtles w))
                      (map move-single-Log (world-Logs w)))]))





;; Helper function to get the position of a turtle
;; turtle-posn: turtle -> posn
;; takes in a turtle and outputs the turtles position
(check-expect (turtle-posn t22) (make-posn 300 325))
(define (turtle-posn v)
  (make-posn (turtle-x v) (turtle-y v)))

;; move-turtle-car: Turtle -> Turtle
;; Moves a single turtle
(check-expect (move-single-turtle t22) (make-turtle 299 325 -1))
(check-expect (move-single-turtle (make-turtle 402 550 1)) (make-turtle 0 550 1))
(check-expect (move-single-turtle (make-turtle -1 450 -1)) (make-turtle 400 450 -1))
(define (move-single-turtle v)
  (if (> (+ (turtle-x v) (turtle-dir v)) 400)
      (make-turtle 0 (turtle-y v) (turtle-dir v))
      (if (< (+ (turtle-x v) (turtle-dir v)) 0)
          (make-turtle 400 (turtle-y v) (turtle-dir v))
          (make-turtle (+ (turtle-x v) (turtle-dir v)) (turtle-y v) (turtle-dir v)))))


;; Helper function to get the position of a Log
;; Log-posn: Log -> posn
;; takes in a Log and outputs the Logs position
(check-expect (Log-posn l22) (make-posn 200 275))
(define (Log-posn v)
  (make-posn (Log-x v) (Log-y v)))

;; move-log-car: Log -> Log
;; Moves a single log
(check-expect (move-single-Log l22) (make-Log 201 275 1))
(check-expect (move-single-Log (make-Log 402 550 1)) (make-Log 0 550 1))
(check-expect (move-single-Log (make-Log -1 450 -1)) (make-Log 400 450 -1))
(define (move-single-Log v)
  (if (> (+ (Log-x v) (Log-dir v)) 400)
      (make-Log 0 (Log-y v) (Log-dir v))
      (if (< (+ (Log-x v) (Log-dir v)) 0)
          (make-Log 400 (Log-y v) (Log-dir v))
          (make-Log (+ (Log-x v) (Log-dir v)) (Log-y v) (Log-dir v)))))


;; collision-turtle?: Player Vehicle -> Boolean
;; Checks if the player collides with a vehicle
(check-expect (collision-turtle? f1 t11) #false)
(check-expect (collision-turtle? (make-player 400 425 frogu) t11) #true) 
(define (collision-turtle? p t)
  (and (<= (abs (- (player-y p) (turtle-y t))) 25)
       (<= (abs (- (player-x p) (turtle-x t))) 25)))


;; check-collision-turtle: Player VSet -> Boolean
;; Helper function to check if any turtle in the set collides with the player
(check-expect (check-collision-turtle (make-player 250 550 frogu) '()) #false)
(check-expect (check-collision-turtle f1 tset) #false)
(check-expect (check-collision-turtle (make-player 400 425 frogu) tset) #true)
(define (check-collision-turtle p tset)
  (cond
    [(empty? tset) #false]
    [(collision-turtle? p (first tset)) #true]
    [else (check-collision-turtle p (rest tset))]))

;; turtle-collides?: World -> Boolean
;; Checks if the frog collides with any vehicle
(check-expect (turtle-collides? w1) #false)
(check-expect (turtle-collides? (make-world (make-player 400 425 frogu) vset tset lset)) #true)
(define (turtle-collides? w)
  (check-collision-turtle (world-player w) (world-turtles w)))



;; collision-log?: Player Vehicle -> Boolean
;; Checks if the player collides with a log
(check-expect (collision-log? f1 l11) #false)
(check-expect (collision-log? (make-player 400 375 frogu) l11) #true) 
(define (collision-log? p l)
  (and (<= (abs (- (player-y p) (Log-y l))) 25)
       (<= (abs (- (player-x p) (Log-x l))) 40)))


;; check-collision-log: Player LSet -> Boolean
;; Helper function to check if any Log in the set collides with the player
(check-expect (check-collision-log (make-player 250 550 frogu) '()) #false)
(check-expect (check-collision-log f1 lset) #false)
(check-expect (check-collision-log (make-player 400 375 frogu) lset) #true)
(define (check-collision-log p lset)
  (cond
    [(empty? lset) #false]
    [(collision-log? p (first lset)) #true]
    [else (check-collision-log p (rest lset))]))

;; log-collides?: World -> Boolean
;; Checks if the frog collides with any log
(check-expect (log-collides? w1) #false)
(check-expect (log-collides? (make-world (make-player 400 375 frogu) vset tset lset)) #true)
(define (log-collides? w)
  (check-collision-log (world-player w) (world-Logs w)))



;; move-player: Player String -> Player
;; Moves the player based on key event
(check-expect (move-player f1 "left") (make-player 190 975 frogl))
(check-expect (move-player f1 "right") (make-player 210 975 frogr))
(check-expect (move-player f1 "up") (make-player 200 965 frogu))
(check-expect (move-player f1 "down") (make-player 200 985 frogd))
(check-expect (move-player f1 "a") (make-player 200 975 frogu))
(define (move-player p key)
  (cond
    [(key=? key "left") (make-player (- (player-x p) 10) (player-y p) frogl)]
    [(key=? key "right") (make-player (+ (player-x p) 10) (player-y p) frogr)]
    [(key=? key "up") (make-player (player-x p) (- (player-y p) 10) frogu)]
    [(key=? key "down") (make-player (player-x p) (+ (player-y p) 10) frogd)]
    [else p]))

;; move-frog: World KeyEvent -> World
;; Moves the frog based on key event
(check-expect (move-frog w1 "left") (make-world (make-player 190 975 frogl) vset tset lset))
(check-expect (move-frog w1 "right") (make-world (make-player 210 975 frogr) vset tset lset))
(check-expect (move-frog w1 "up") (make-world (make-player 200 965 frogu) vset tset lset))
(check-expect (move-frog w1 "down") (make-world (make-player 200 985 frogd) vset tset lset))
(check-expect (move-frog w1 "a") (make-world (make-player 200 975 frogu) vset tset lset))
(define (move-frog w key)
  (make-world (move-player (world-player w) key) (world-vehicles w) (world-turtles w) (world-Logs w)))


;; collision?: Player Vehicle -> Boolean
;; Checks if the player collides with a vehicle
(check-expect (collision? f1 v11) #false)
(check-expect (collision? (make-player 400 900 frogu) v11) #true) 
(define (collision? p v)
  (and (<= (abs (- (player-y p) (vehicle-y v))) 15)
       (<= (abs (- (player-x p) (vehicle-x v))) 30)))



;; check-collision: Player VSet -> Boolean
;; Helper function to check if any vehicle in the set collides with the player
(check-expect (check-collision (make-player 250 550 frogu) '()) #false)
(check-expect (check-collision f1 vset) #false)
(check-expect (check-collision (make-player 300 900 frogu) vset) #true)
(define (check-collision p vset)
  (cond
    [(empty? vset) #false]
    [(collision? p (first vset)) #true]
    [else (check-collision p (rest vset))]))

;; frog-collides?: World -> Boolean
;; Checks if the frog collides with any vehicle
(check-expect (frog-collides? w1) #false)
(check-expect (frog-collides? (make-world (make-player 300 900 frogu) vset tset lset)) #true)
(define (frog-collides? w)
  (check-collision (world-player w) (world-vehicles w)))

;;frog-drowns?: World -> Boolean
;;checks to see if the frog is in the water
(check-expect (frog-drowns? w1) #false)
(check-expect (frog-drowns? (make-world (make-player 400 375 frogu) vset tset lset)) #false)
(check-expect (frog-drowns? (make-world (make-player 300 375 frogu) vset tset lset)) #true)
(define (frog-drowns? w)
  (and (and (< (player-y (world-player w)) 400)
            (> (player-y (world-player w)) 100))
       (false? (log-collides? w))
       (false? (turtle-collides? w))))



;;frog-out-of-world? World -> Boolean
;;checks to see if the frog leaves the world
(check-expect (frog-out-of-world? w1) #false)
(check-expect (frog-out-of-world? (make-world (make-player 420 420 frogu) vset tset lset)) #true)
(check-expect (frog-out-of-world? (make-world (make-player -20 420 frogu) vset tset lset)) #true)
(define (frog-out-of-world? w)
  (or (< (player-x (world-player w)) 0)
      (> (player-x (world-player w)) 400)))
      
       

;; frog-reached-top?: World -> Boolean
;; Checks if the frog has reached the top of the screen
(check-expect (frog-reached-top? w1) #false)
(check-expect (frog-reached-top? (make-world (make-player 150 20 frogu) vset tset lset)) #true)
(define (frog-reached-top? w)
  (<= (player-y (world-player w)) 50))

;; game-over?: World -> Boolean
;; Checks if the game should be over (collision or frog reaches top)
(check-expect (game-over? w1) #false)
(check-expect (game-over? (make-world (make-player 300 900 frogu) vset tset lset)) #true)
(check-expect (game-over? (make-world (make-player 150 20 frogu) vset tset lset)) #true)
(define (game-over? w)
  (or (frog-collides? w) (frog-reached-top? w) (frog-drowns? w) (frog-out-of-world? w)))

;; run the game
(start w1)
