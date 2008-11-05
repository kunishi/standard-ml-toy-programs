fun collatz(n:int) =
    if n = 1 then 1
    else if n mod 2 = 0 then collatz(n div 2)
    else collatz(n * 3 + 1);

