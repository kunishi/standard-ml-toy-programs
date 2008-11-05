fun mergeSort(nil) = nil
|   mergeSort([a]) = [a]
|   mergeSort(L)   =
	let
	    val (M, N) = split(L);
	    val M = mergeSort(M);
	    val N = mergeSort(N);
	in
	    merge(M, N)
	end;
