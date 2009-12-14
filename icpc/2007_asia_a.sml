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
	    in
		output (stdOut, Int.toString (hd params) ^ "\n")
	    end;
	closeIn f
    end;
