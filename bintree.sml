datatype 'label btree =
    Empty |
    Node of 'label * 'label btree * 'label btree;

fun lower(nil) = nil
  | lower(c::cs) = (Char.toLower c)::lower(cs);

fun lt(x, y) = 
    implode(lower(explode(x))) < implode(lower(explode(y)));

fun insert(x, Empty) = Node(x, Empty, Empty)
  | insert(x, T as Node(y, left, right)) =
    if x=y then T
    else if lt(x, y) then Node(y, insert(x, left), right)
	 else (* lt(y, x) *) Node(y, left, insert(x, right));

fun list_to_bintree(nil) = Empty
  | list_to_bintree(x::xs) = insert(x, list_to_bintree(xs));

fun inOrder(Empty) = nil
  | inOrder(Node(a, left, right)) = 
    inOrder(left) @ [a] @ inOrder(right);
