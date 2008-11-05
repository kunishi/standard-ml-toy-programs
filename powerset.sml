fun consset(a, nil) = nil
|   consset(a, x::xs) = (a::x)::consset(a, xs);

fun powerset(nil) = [nil]
  | powerset((x:int)::xs) = powerset(xs)@consset(x, powerset(xs));
