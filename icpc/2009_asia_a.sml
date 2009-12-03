fun block nil nil = 0
 |  block (x::xs) nil = x
 |  block nil (y::ys) = y
 |  block (X as x::xs) (Y as y::ys) =
     if x = y then x + block xs ys
     else if x > y then x + block xs Y
     else y + block X ys;

fun sort _ nil = nil
 |  sort f (X as x::xs) = sort f (List.filter (fn y => f y x = LESS) xs)
                   @ (List.filter (fn y => f y x = EQUAL) X)
                   @ sort f (List.filter (fn y => f y x = GREATER) xs);

fun compare x y = 
    if x < y then LESS
    else if x > y then GREATER
    else EQUAL;

fun prob L M = block (List.rev (sort compare L))
                     (List.rev (sort compare M));
