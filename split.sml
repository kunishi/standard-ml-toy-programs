fun split(nil) = (nil, nil)
|   split([a]) = ([a], nil)
|   split(a::b::cs) =
	let
	    val (M, N) = split(cs)
	in
	    (a::M, b::N)
	end;
