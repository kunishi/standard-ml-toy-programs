datatype 'a btree = Empty | Node of 'a * 'a btree * 'a btree;

fun find_in_btree(x, Empty) = false
 |  find_in_btree(x, Node(a, l, r)) =
    x = a orelse find_in_btree(x, l) orelse find_in_btree(x, r);
