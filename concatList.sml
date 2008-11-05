fun concat(s, t) = s ^ t;
fun concatList(L) = reduce(concat,
			   map(Char.toString, L);
