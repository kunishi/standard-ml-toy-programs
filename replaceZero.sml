fun replaceZero(L) = 
    map(fn n => if n<0 then 0 else n, L);
