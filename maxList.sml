fun maxList(L) = 
    if tl(L) = nil
	then hd(L)
	else
	    let
		val x = hd(L);
		val y = maxList(tl(L))
	    in
		if x<y then y else x
	    end;
