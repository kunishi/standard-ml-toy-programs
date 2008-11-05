fun swapNeighbor(nil) = nil
|   swapNeighbor(x::nil) = x::nil
|   swapNeighbor(x::y::zs) = y::x::swapNeighbor(zs);