-- zadanie 1
-- a
member x l = 
    foldl (\a b -> a || b == x) False l

-- b
delete x l =
    filter (/=x) l

-- c
exists pred l = 
    foldl (\x y -> x && pred y) True l

-- zadanie 2
-- a
cut [] = []
cut (x:[]) = []
cut (x:xs) = reverse ((\(l:ls) -> ls) (reverse xs))

-- b
palindrom [] = True
palindrom (l:[]) = True
palindrom (l:ls) =
    l == (last ls) && palindrom (cut (l:ls)) 

-- zadanie 3
data Tree a b = Leaf a | Node a b (Tree a b) (Tree a b)

-- a
sumTree :: Tree Integer b -> Integer
sumTree (Leaf a) = a
sumTree (Node a _ t1 t2) = a + sumTree t1 + sumTree t2

-- b
preTree :: Tree a b -> [a]
preTree (Leaf a) = [a]
preTree (Node a _ t1 t2) = [a] ++ preTree t1 ++ preTree t2

-- c 
mapb :: (b -> b) -> Tree a b -> Tree a b
mapb f (Leaf a) = (Leaf a)
mapb f (Node a b t1 t2) = Node a (f b) (mapb f t1) (mapb f t2)

-- testowe drzewko:
sampleTree = Node 10 'a' (Leaf 10) (Node 10 'b' (Node 10 'c' (Leaf 20) (Leaf 50)) (Leaf 100))

-- zadanie 4
-- a
---------------------------------
-- \f -> f x

-- 1. {x :: a} |- x :: a
-- 2. {f :: b} |- f :: b
-- 3. s(b) = s(c -> d)
-- 4. s(c) = s(a)
-- 5. {f :: a -> d} |- (f x) :: d

-- a więc

-- \f -> f x :: (a -> d) -> d 
---------------------------------
-- b
---------------------------------
-- 2 * (x + y)

-- 1. {} -> (+) :: Int -> Int -> Int
-- 2. {} -> 2 :: Int
-- 3. {x :: a} |- x :: a
-- 4. {y :: b} |- y :: b
-- 5. s = unify(Int, a) -> s(a) = Int
-- 6. {x :: Int} |- (+ x) :: Int -> Int 
-- 7. s = unify(Int, b) -> s(b) = Int
-- 8. {y :: Int} |- (+ x y) :: Int
-- 9. {} -> (*) :: Int -> Int -> Int
-- 10. {} -> (* 2) :: Int -> Int
-- 11. {x :: Int, y :: Int} |- (* 2 (+ x y)) :: Int

-- a więc

-- 2 * (x + y) :: Int
---------------------------------