fun smult(nil, q) = nil
|   smult((p:real)::ps, q) = (p*q)::smult(ps, q);
