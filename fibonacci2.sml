fun fib n = 
    let
	fun fib1 1 = (1, 0)
	  | fib1 n = 
	    let
		val (l, m) = fib1 (n-1)
	    in 
		(l + m, l)
	    end 
    in 
	#1 (fib1 n)
    end;
