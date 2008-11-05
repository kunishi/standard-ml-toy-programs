fun rotate(L) =
    if L=nil then nil
    else tl(L) @ [hd(L)];
