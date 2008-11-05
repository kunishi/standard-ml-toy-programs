val rec padd = fn
    (P, nil) => P
  | (nil, Q) => Q
  | ((p:real)::ps, q::qs) => (p+q)::padd(ps, qs);

val rec smult = fn 
    (nil, q) => nil
  | ((p:real)::ps, q) => (p*q)::smult(ps, q);

val rec pmult = fn
    (P, nil) => nil
  | (P, q::qs) => padd(smult(P, q), 0.0::pmult(P, qs));
