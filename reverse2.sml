fun reverse L = 
    let
      fun rev1 nil L = L
       |  rev1 (x::xs) L = rev1 xs (x::L)
    in
      rev1 L nil
    end;
