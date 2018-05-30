ffoldl f e [] = e --- parametry: funkcja, wartość początkowa (akumulator), lista
ffoldl f e (x:xs) =
    ffoldl f (f e x) xs

ffoldr f e [] = e
ffoldr f e (x:xs) =
    f x (foldr f e xs)

--- Funkcje przydatne do tych z zad 14
fsum = ffoldr (+) 0
fdif = ffoldr (-) 0

nwd n 0 = n
nwd n m = nwd m (mod n m)

--- zad 14
fprod = ffoldl (*) 1
flength = ffoldl (\x y -> x + 1) 0
fand = ffoldl (\x y -> x && y) True
fnwd = ffoldl nwd 0
fdelete n = ffoldr (\x y -> if x == n then y else (x:y)) []
ffmap f = ffoldr (\x y -> (f x):y ) []
freverse = ffoldl (flip (:)) []