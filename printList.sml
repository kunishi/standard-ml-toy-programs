fun printList(nil) = ()
|   printList(x::xs) =
    (print(Int.toString(x));
     print("\n");
     printList(xs));
