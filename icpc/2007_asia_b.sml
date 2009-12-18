exception NotFoundException

(*
fun get_primes n =
    let
	open Array
	fun check array = 
	    let
		fun check_one n array =
		    if not (sub (!array, n)) then ()
		    else modifyi (fn (i, x) => 
				     if i <= n then x
				     else x andalso (i mod n <> 0)) (!array)
		val i = ref 1
	    in
		while (i := !i + 1; !i < Array.length (!array)) do
		    check_one (!i) array;
		array
	    end
	val prime_array = !(check (ref (Array.array (n, true))))
	fun collect_primes 0 array result = result
	  | collect_primes n array result = 
	    if sub (array, n-1)
	    then collect_primes (n-1) array ((n-1)::result)
	    else collect_primes (n-1) array result
    in
	List.filter (fn x => x >= 2) (collect_primes n prime_array nil)
    end
*)

fun get_primes n =
    let
	val l = List.tabulate (n, fn n => n + 2)
	fun get_primes_sub nil result = result
	  | get_primes_sub (x::xs) result = 
	    get_primes_sub (List.filter (fn n => n mod x <> 0) xs) (x::result)
    in
	List.rev (get_primes_sub l nil)
    end

fun solve_one n primes ppairs =
    case List.find (fn x => x = n) primes of
	SOME x => x
      | NONE => case List.find (fn (p, q) => p <= n andalso n < q) ppairs of
		    SOME (p, q) => q - p
		  | NONE => raise NotFoundException

fun solve file =
    let
	open TextIO
	val primes = get_primes 1299720
	val ppairs = ListPair.zip (primes, tl primes)
	val f = openIn file
	val line = ref NONE
    in
	while (line := inputLine f; !line <> SOME "0\n") do
	    let
		val n = Int.fromString (valOf (!line))
	    in
		case n of
		    SOME v => 
		    output (stdOut, 
			    Int.toString (solve_one v primes ppairs) ^ "\n")
		  | NONE => raise NotFoundException
	    end;
	closeIn f
    end
