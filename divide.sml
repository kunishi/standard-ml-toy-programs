fun divide nil  = (nil, nil)
  | divide (x::nil) = ([x], nil)
  | divide (x::y::xs) = 
    let
	val (ys, zs) = divide xs
    in
	(x::ys, y::zs)
    end;
