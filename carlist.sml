fun carlist(nil) = nil
|   carlist(nil::xs) = carlist(xs)
|   carlist((x::xs)::ys) = x::carlist(ys);
