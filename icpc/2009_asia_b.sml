fun subst src dst s =
    let
	open Substring
	fun subst_sub src dst ss =
	    let
		val (pref, suff) = position src ss
	    in
		if isEmpty suff (* not found *)
		then [pref]
		else pref :: (full dst) :: 
		     subst_sub src dst (triml (String.size src) suff)
	    end
    in
	concat (subst_sub src dst (full s))
    end

fun isSolution s = List.exists (fn x => x = s)

fun subst_candidate nil l = nil
  | subst_candidate ([src, dst]::rs) l =
    let
	open List
	fun sort _ nil = nil
	  | sort f (xl as x::xs) = sort f (filter (fn y => f y x = LESS) xs)
			   @ [x]
			   @ sort f (filter (fn y => f y x = GREATER) xs)
	fun compare x y = 
	    if x < y then LESS
	    else if x > y then GREATER
	    else EQUAL
	val set = (List.map (subst src dst) l) @ subst_candidate rs l
    in
	sort compare (List.filter (fn s => size s <= 10) set)
    end

fun solve_one rules src dst = 
    let
	fun solve_one_sub rules cands dst i =
	    if isSolution dst cands then i
	    else if i > 10 then ~1
	    else solve_one_sub rules (subst_candidate rules cands) dst (i+1)
    in
	solve_one_sub rules [src] dst 0
    end

fun chop_nl s = 
    let
	open Substring
	fun notc (c:char) = fn c' => c <> c'
    in
	string (takel (notc #"\n") (full s))
    end

fun read_rules f 0 = nil
  | read_rules f n = 
    let 
	fun split s = String.tokens (fn c => c = #" ") s
	val line = TextIO.inputLine f
    in
	split (chop_nl (valOf line)) :: read_rules f (n-1)
    end

fun solve filename = 
    let
	open TextIO
	val f = openIn filename
	val line = ref NONE
    in
	while (line := inputLine f; !line <> SOME "0\n") do
	    let
		val n = valOf (Int.fromString (valOf (!line)))
		val rules = read_rules f n
		val src = chop_nl (valOf (inputLine f))
		val dst = chop_nl (valOf (inputLine f))
		val result = solve_one rules src dst
	    in
		output (stdOut, (Int.toString result) ^ "\n")
	    end;
	closeIn f
    end
