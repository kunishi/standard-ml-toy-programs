val sqrt = Math.sqrt;

fun vec_length(nil) = nil
 |  vec_length((x, y)::zs) = sqrt(x * x + y * y)::vec_length(zs);
