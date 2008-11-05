fun square(x:real) = x*x;
fun plus(x:real, y) = x+y;
fun length(nil) = 0.0
  | length(x::xs) = 1.0 + length(xs);
fun variance(L) =
    let
	val n = length(L)
    in
	reduce(plus, map(square, L))/n -
	square(reduce(plus, L)/n)
    end;
