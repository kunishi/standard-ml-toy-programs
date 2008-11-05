fun comb(n,m) =
    if m=0 orelse m=n then 1
    else comb(n-1, m) + comb(n-1, m-1);
