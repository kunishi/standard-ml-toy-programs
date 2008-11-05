fun merge(nil, M) = M
|   merge(L, nil) = L
|   merge(L as x::xs, M as y::ys) = 
      if (x:int) < y then x::merge(xs, M)
      else y::merge(L, ys);
