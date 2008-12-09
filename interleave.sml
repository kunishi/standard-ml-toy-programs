fun interleave n nil = [[n]]
  | interleave n (L as x::xs) = (n::L) :: map (fn L => x::L) (interleave n xs);
