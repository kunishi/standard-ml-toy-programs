use "interleave.sml";

fun perm nil = [nil]
  | perm (x::xs) = List.concat (map (interleave x) (perm xs));
