fun partition(p, nil) = (nil, nil)
  | partition(p, x::xs) =
    let
	val (ys, zs) = partition(p, xs)
    in
	if p(x) then (x::ys, zs)
	else (ys, x::zs)
    end;
