fun millionPower(x:real) =
    let
	val four = x*x*x*x;
	val twenty = four*four*four*four*four;
	val hundred = twenty*twenty*twenty*twenty*twenty;
	val fivehundred = hundred*hundred*hundred*hundred*hundred
    in
	fivehundred*fivehundred
    end;
