fun duplicate(nil) = nil
|   duplicate(x::xs) = x::x::duplicate(xs);
