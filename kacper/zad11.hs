map2 f l1 [] = l1
map2 f (x:xs) (y:ys) = map2 f (xs++[(f x y)]) ys

pairing [] [] = []
pairing (l:ls) (m:ms) = 
    (l,m):(pairing ls ms)

skalar s list = 
    map2 (\x y -> x*s) list list