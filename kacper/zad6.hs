fgcd n 0 = n
fgcd n m = fgcd m (mod n m)

flcm a b = div (a * b) (fgcd a b)