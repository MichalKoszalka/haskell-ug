ffoldl f e [] = e --- parametry: funkcja, wartość początkowa (akumulator), lista
ffoldl f e (x:xs) =
    ffoldl f (f e x) xs

ffoldr f e [] = e
ffoldr f e (x:xs) =
    f x (foldr f e xs)

cmpfunc :: Int -> Int -> Bool
cmpfunc a b = a > b

func :: (a -> a -> Bool) -> [a] -> a -> [a]
func cmp [] a = [a]
func cmp (x:xs) a =
    if cmp x a then a:x:xs
    else x:(func cmp xs a)

insertionsort :: (a -> a -> Bool) -> [a] -> [a]
insertionsort cf [] = []
insertionsort cf list =
    ffoldl (func cf) [] lis
