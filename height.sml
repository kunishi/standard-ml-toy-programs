datatype 'label btree = 
	 Empty | 
	 Node of 'label * 'label btree * 'label btree;

fun height(Empty) = 0
  | height(Node(x, l, r)) = 
    let
	val hl = height(l);
	val hr = height(r)
    in
	if hl > hr then hl+1 else hr+1
    end;
