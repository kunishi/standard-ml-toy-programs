fun rev1(nil, M) = M
|   rev1(x::xs, ys) = rev1(xs, x::ys);

fun reverse(L) = rev1(L, nil);
