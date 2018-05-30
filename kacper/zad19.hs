a) map square [1,2,3] :: [Int]
b) map square ['a', 'b', 'c'] :: błąd, 
    expected (Int -> Int) -> [Int] -> [Int]
    got (Int -> Int) -> [Char] -> [Int]

c) \x -> 2 * x :: Int -> Int
d) \f -> f 3 :: (Int -> a) -> a
e) \f x -> f (f x) :: (a -> a) -> a -> a
f) (\f x -> f (f x)) square :: Int -> Int
g) (\f x -> f (f x)) (\x -> x) :: a -> a
h) \x -> x x :: błąd -- x x typem pierwszego x musiałoby być jakieś a -> b, a drugiego x a
                     -- Więc jest to z grubsza sprzeczne
i) { f :: Int -> a -> b, g :: Char -> a }  |-  f 7 (g 'a') :: b