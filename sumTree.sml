datatype ('label) tree = 
  Node of 'label * 'label tree list;

fun sum(Node(a, nil)) = a
  | sum(Node(a, t::ts)) = sum(t) + sum(Node(a, ts));
