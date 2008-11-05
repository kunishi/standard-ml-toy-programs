fun reverse(nil) = nil
  | reverse(x::xs) = reverse(xs)@[x];
fun revrev(nil) = nil
  | revrev(x::xs) = revrev(xs)@[reverse(x)];
