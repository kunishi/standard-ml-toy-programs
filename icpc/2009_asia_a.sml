fun block nil nil = 0
 |  block (x::xs) nil = x + block xs nil
 |  block nil (y::ys) = y + block nil ys
 |  block (xl as x::xs) (yl as y::ys) =
     if x = y then x + block xs ys
     else if x > y then x + block xs yl
     else y + block xl ys;

fun sort _ nil = nil
 |  sort f (xl as x::xs) = sort f (List.filter (fn y => f y x = LESS) xs)
                   @ (List.filter (fn y => f y x = EQUAL) xl)
                   @ sort f (List.filter (fn y => f y x = GREATER) xs);

fun compare x y = 
    if x < y then LESS
    else if x > y then GREATER
    else EQUAL;

fun prob l m = block (List.rev (sort compare l))
                     (List.rev (sort compare m));
