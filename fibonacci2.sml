fun fib1 1 = (1, 0)
  | fib1 n = 
    let
	val (l, m) = fib1 (n-1)
    in
	(l + m, l)
    end;

fun fib n = #1 (fib1 n);
