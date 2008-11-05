fun flatten(nil) = nil
  | flatten(nil::ys) = flatten(ys)
  | flatten((xa as x::xs)::ys) = xa @ flatten(ys);
