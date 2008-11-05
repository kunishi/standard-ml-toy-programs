datatype 'label btree =
    Empty |
    Node of 'label * 'label btree * 'label btree;

fun sumBinTree(Empty) = 0
  | sumBinTree(Node(a, left, right)) =
    a + sumBinTree(left) + sumBinTree(right);
