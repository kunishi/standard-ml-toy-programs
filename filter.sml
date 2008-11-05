fun filter(P, nil) = nil
  | filter(P, x::xs) =
    if P(x)
	then x::filter(P,xs)
	else filter(P,xs);
