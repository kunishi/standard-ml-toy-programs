fun count (x, nil) = 0
  | count (x, y::ys) = if x = y then 1 + count(x, ys) else count(x, ys);
