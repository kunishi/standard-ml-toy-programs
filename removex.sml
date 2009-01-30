fun removex n nil = nil
 |  removex n (x::xs) = 
    (if n=x then (fn y => y)
            else (fn y => (x::y))) (removex n xs);
