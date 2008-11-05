fun reverse(nil) = nil
  | reverse(x::xs) = reverse(xs)@[x];

fun palindrome(x) =
    let
	val xchars = explode(x)
    in
	xchars = reverse(xchars)
    end;
