fun combine(nil) = nil
|   combine([x]) = [(x, 0)]
|   combine(x::y::zs) = (x,y)::combine(zs);
