fun reverse(nil) = nil
|   reverse(x::xs) = reverse(xs)@[x];

fun ends(L) =
    [hd(L), hd(reverse(L))];
