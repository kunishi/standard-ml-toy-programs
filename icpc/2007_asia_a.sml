fun remove_a_stone vec i =
    let
	open VectorSlice
	val size = Vector.length vec - 1
	val newvec = 
	    if i = 0 then concat [slice (vec, 1, SOME size)]
	    else if i = size then concat [slice (vec, 0, SOME size)]
	    else concat [slice (vec, 0, SOME i),
			 slice (vec, i+1, SOME (size-i))]
    in
	(newvec, i mod size)
    end

fun solve_one n k m =
    let
	val vec = Vector.tabulate (n, fn i => i+1)
	fun remove_stones vec k m =
	    if Vector.length vec = 1 then Vector.sub (vec, 0)
	    else
		let
		    (* val stone = Vector.sub (vec, m) *)
		    val (newvec, newm) = remove_a_stone vec m
		    val size = Vector.length newvec
		in
		    (*
		     TextIO.output (TextIO.stdOut, Int.toString stone ^ " ");
		     *)
		    remove_stones newvec k ((newm + k - 1) mod size)
		end
    in
	remove_stones vec k (m - 1)
    end

fun solve file =
    let
	open TextIO
	val f = openIn file
	val line = ref NONE
	fun split s = String.tokens (fn c => c = #" ") s
	fun toIntList l = List.map (fn s => valOf (Int.fromString s)) l
    in
	while (line := inputLine f; !line <> SOME "0 0 0\n") do
	    let
		val params = toIntList (split (valOf (!line)))
		val n = hd params
		val k = List.nth (params, 1)
		val m = List.nth (params, 2)
		val result = solve_one n k m
	    in
		output (stdOut, Int.toString result ^ "\n")
	    end;
	closeIn f
    end
