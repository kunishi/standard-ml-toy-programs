exception EmptyList;
fun reduce(F, nil) = raise EmptyList
  | reduce(F, [a]) = a
  | reduce(F, x::xs) = F(x, reduce(F, xs));
