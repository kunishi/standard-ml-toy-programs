fun sort _ nil = nil
  | sort f (xl as x::xs) = sort f (List.filter (fn y => f y x = LESS) xs)
			   @ (List.filter (fn y => f y x = EQUAL) xl)
			   @ sort f (List.filter (fn y => f y x = GREATER) xs);

fun compare x y = 
    if x < y then LESS
    else if x > y then GREATER
    else EQUAL;

fun solve_one front side = 
    let
       fun block nil nil = 0
         | block (x::xs) nil = x + block xs nil
         | block nil (y::ys) = y + block nil ys
         | block (xl as x::xs) (yl as y::ys) =
           if x = y then x + block xs ys
           else if x > y then x + block xs yl
           else y + block xl ys
    in
	block (List.rev (sort compare front)) (List.rev (sort compare side))
    end;

fun solve filename eod =
    let
	open TextIO
	val indata = openIn filename
	val b = ref NONE
	fun split s = String.tokens (fn c => c = #" ") s
	fun toIntList l = List.map (fn s => valOf (Int.fromString s)) l
    in
	while (b := inputLine indata; (!b) <> SOME eod) do 
	    let
		val front = toIntList (split (valOf (inputLine indata)))
		val side = toIntList (split (valOf (inputLine indata)))
            in
		output (stdOut, (Int.toString (solve_one front side)) ^ "\n")
            end;
	closeIn indata
    end;

solve "2009_asia_a_in.txt" "0 0\n"
