fun merge(nil, M) = M
|   merge(L, nil) = L
|   merge(x::xs, y::ys) = 
      if (x:int) < y then x::merge(xs, y::ys)
      else y::merge(x::xs, ys);
