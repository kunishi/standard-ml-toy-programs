fun padd(P, nil) = P
|   padd(nil, Q) = Q
|   padd((p:real)::ps, q::qs) = (p+q)::padd(ps, qs);

fun smult(nil, q) = nil
|   smult((p:real)::ps, q) = (p*q)::smult(ps, q);

fun pmult(P, nil)   = nil
|   pmult(P, q::qs) = padd(smult(P, q), 0.0::pmult(P, qs));
