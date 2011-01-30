val sqrt = Math.sqrt;

fun simpleMap(f, nil) = nil
 |  simpleMap(f, x::xs) = f(x) :: simpleMap(f, xs);

fun vec_length(L) = simpleMap(fn (x, y) => sqrt(x * x + y * y), L);

