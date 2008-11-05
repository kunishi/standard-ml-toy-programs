fun memq(x, nil) = false
  | memq(x, y::ys) = 
    if x = y then true
    else memq(x, ys);

fun subset(nil, ys) = true
  | subset(x::xs, ys) = 
    if memq(x, ys) = false
	then false
    else subset(xs, ys);