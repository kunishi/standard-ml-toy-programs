fun flatten nil = nil
 |  flatten (x::xs) = x @ flatten(xs);
