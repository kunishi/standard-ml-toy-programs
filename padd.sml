fun padd(P, nil) = P
|   padd(nil, Q) = Q
|   padd((p:real)::ps, q::qs) = (p+q)::padd(ps, qs);
