fun removeeven(nil) = nil
  | removeeven(x::xs) =
    if x mod 2 = 0
	then removeeven(xs)
    else x::removeeven(xs);
