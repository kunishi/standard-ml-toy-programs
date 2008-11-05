fun duplicate(L) =
    if L=nil then nil
    else hd(L)::hd(L)::duplicate(tl(L));
