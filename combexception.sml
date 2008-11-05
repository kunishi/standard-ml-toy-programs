exception BadN;
exception BadM;

fun comb(n,m) =
    if n<0 then raise BadN
    else if m<0 orelse m>n then raise BadM
    else if m=0 orelse m=n then 1
    else comb(n-1, m) + comb(n-1, m-1);
