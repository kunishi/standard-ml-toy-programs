(* not finished *)
fun isPrefix_list l m = 
    ListPair.foldl (fn (x, y, result) => result andalso (x = y)) true (l, m);

fun solve_one n rules src dst = n

fun chop_nl s = String.substring(s, 0, String.size s)

fun read_rules f 0 = nil
  | read_rules f n = 
    let 
	fun split s = String.tokens (fn c => c = #" ") s
	val line = TextIO.inputLine f
    in
	split (chop_nl (valOf line)) :: read_rules f (n-1)
    end;

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
		val result = solve_one n rules src dst
	    in
		output (stdOut, (Int.toString result) ^ "\n")
	    end;
	closeIn f
    end;
