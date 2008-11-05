fun eval(nil, a)   = 0.0
|   eval(p::ps, a) = p + eval(ps, a)*a;
