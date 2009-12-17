exception NotFoundException

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

fun solve_one n nil = raise NotFoundException
  | solve_one n ((p, q)::rs) = if n = p then 0
			       else if p < n andalso n < q then q - p
			       else solve_one n rs

fun solve file =
    let
	open TextIO
	val primes = get_primes (gen_int_list 1299709)
	val ppairs = ListPair.zip (primes, tl primes)
	val f = openIn file
	val line = ref NONE
    in
	while (line := inputLine f; !line <> SOME "0\n") do
	    let
		val n = Int.fromString (valOf (!line))
	    in
		output (stdOut, 
			Int.toString (solve_one (valOf n) ppairs) ^ "\n")
	    end;
	closeIn f
    end
