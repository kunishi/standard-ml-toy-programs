fun proportional(x, i) =
    if i=0
	then 1
	else x * proportional(x, i-1)
