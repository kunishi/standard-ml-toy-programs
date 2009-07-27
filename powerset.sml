fun consset(a, nil) = nil
|   consset(a, x::xs) = (a::x)::consset(a, xs);

fun powerset(nil) = [nil]
  | powerset(x::xs) = 
    let
	val p = powerset(xs)
    in 
	p@consset(x, p)
    end;
