fun area1 1 = 1
 |  area1 n = n * n + area1 (n-1);

fun area n = real (area1 n) / real (n * n * n);
