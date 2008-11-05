fun exists(p, nil) = false
|   exists(p, x::xs) = p(x) orelse exists(p, xs);
