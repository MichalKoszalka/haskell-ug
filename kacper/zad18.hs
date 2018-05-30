a) (+) :: Int -> Int -> Int
b) (+ 37) :: Int -> Int
c) append :: a -> [a] -> [a]
d) append [1,2] :: Int -> [Int]
e) map :: (a -> b) -> [a] -> [b]
f) map square [1,2,3,4,5] :: [Int]
g) foldl :: (a -> b -> a) -> a -> [b] -> a
h) foldl (++) :: [a] -> [[a]] -> [a]
i) foldl (++) [] :: -> [[a]] -> [a]


j) {f :: Int -> a} |- f 7 :: a
k) \f -> f 7 :: (Int -> a) -> a
l) {x :: a, f :: a -> Int, g :: a -> Int} |- + (f x) (g x) :: Int
m) {f :: Int -> a -> b, g :: Char -> a} |- f 7 (g 'x') :: b
n) {x :: a, g :: a -> b} |- \f -> f (g x) :: (b -> c) -> c
o) {x :: a, g :: a -> Int} |- (\f -> f (g x)) square :: Int
