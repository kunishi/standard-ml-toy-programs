fun swap nil = nil
 |  swap [x] = [x]
 |  swap (x::y::zs) = y::x::(swap zs);
