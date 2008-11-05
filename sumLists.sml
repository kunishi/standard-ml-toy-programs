fun sumLists(nil) = 0
|   sumLists(nil::YS) = sumLists(YS)
|   sumLists((x::xs)::YS) = x + sumLists(xs::YS);
