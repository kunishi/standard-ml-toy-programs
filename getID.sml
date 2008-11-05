exception NotFound;

fun getID(person, nil) = raise NotFound
  | getID(person, (x as {name=p, ...})::xs) =
    if p = person then
	#ID(x:{name:string, ID:int, courses:string list})
    else getID(person, xs);
