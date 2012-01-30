fun factorial n =
  let
    fun fact1 1 result = result
     |  fact1 n result = fact1 (n-1) (n * result)
  in
    fact1 n 1
  end;
