fun nth(L, n) =
    if n = 1 then hd(L)
    else nth(tl(L), n-1);