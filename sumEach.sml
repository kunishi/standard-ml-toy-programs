fun sumEach(nil) = (0, 0)
  | sumEach((x, y)::xs) =
    let
      val (s1, s2) = sumEach(xs)
    in
      (x + s1, y + s2)
    end;
