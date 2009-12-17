fun get_primes l =
    let
	fun get_primes_sub nil result = result
	  | get_primes_sub (x::xs) result = 
	    get_primes_sub (List.filter (fn n => n mod x <> 0) xs) (x::result)
    in
	List.rev (get_primes_sub l nil)
    end

fun gen_int_list n =
    let
	fun gen_int_list_sub 1 result = result
	  | gen_int_list_sub n result = gen_int_list_sub (n-1) (n::result)
    in
	gen_int_list_sub n nil
    end

