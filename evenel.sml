fun evenel(nil) = nil
 |  evenel(nil::zzs) = evenel(zzs)
 |  evenel([x]::zzs) = evenel(zzs)
 |  evenel((x::y::zs)::zzs) = y::evenel(zs::zzs);
