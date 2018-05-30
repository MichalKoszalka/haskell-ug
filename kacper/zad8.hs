silnia 0 = 1
silnia n = n * (silnia (n-1))

fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)


asilnia 0 = 1
asilnia n = isilnia (n-1) n
isilnia 0 i = i
isilnia n i = isilnia (n-1) (i*n)

afib n = ifib n 0 1
ifib 0 a b = a
ifib n a b = ifib (n-1) b (a+b)