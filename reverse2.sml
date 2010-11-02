fun rev1 nil L = L
 |  rev1 (x::xs) L = rev1 xs (x::L)

fun reverse L = rev1 L nil
