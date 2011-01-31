fun remove_second(L) = 
  if List.length(L) < 2 then nil else hd(L) :: tl(tl(L));
