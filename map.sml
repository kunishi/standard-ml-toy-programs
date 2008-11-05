fun map(F, nil) = nil
  | map(F, x::xs) = F(x)::map(F,xs);
