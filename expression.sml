open TextIO;
exception Syntax;

fun digit(c) = (#"0" <= c andalso c <= #"9");

fun integer(IN, i) = 
    case lookahead(IN) of
	SOME c =>
	    if digit(c) then
		(input1(IN);
		 integer(IN, 10*i+(ord(c)-ord(#"0")))
		 )
	    else i
      | NONE => i;

fun atom(IN) =
    case lookahead(IN) of
	SOME #"(" => 
	    (input1(IN);
	     let
		 val e = expression(IN)
	     in
		 if lookahead(IN) = (SOME #")")
		     then
			 (input1(IN);
			  e
			  )
		 else raise Syntax
	     end
	     )
      | SOME c =>
	    if digit(c) then integer(IN, 0)
		else raise Syntax
      | NONE => raise Syntax
and
    term(IN) = termTail(IN, atom(IN))
and
    termTail(IN, i) =
    case lookahead(IN) of
	SOME #"*" => (input1(IN);
		      termTail(IN, i * atom(IN)))
      | SOME #"/" => (input1(IN);
		      termTail(IN, i div atom(IN)))
      | _ => i
and
    expression(IN) = expTail(IN, term(IN))
and
    expTail(IN, i) =
    case lookahead(IN) of
	SOME #"+" => (input1(IN);
		      expTail(IN, i + term(IN)))
      | SOME #"-" => (input1(IN);
		      expTail(IN, i - term(IN)))
      | _ => i;

val infile = openIn("test");

expression(infile);
