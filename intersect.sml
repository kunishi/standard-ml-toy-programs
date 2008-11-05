fun intersect(nil, _) = nil
  | intersect(_, nil) = nil
  | intersect(xa as x::xs, ya as y::ys) = 
    if x = y then x::intersect(xs, ys)
    else if x < y then intersect(xs, ya)
	 else intersect(xa, ys) (* x > y *);
