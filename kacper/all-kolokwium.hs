-- Własny reverse i last
reverse2 [] = []
reverse2 (x:xs) = reverse2 xs ++ [x]

last2 (x:[]) = x
last2 (x:xs) = last2 xs

-- Filter z list comprehension
filterB p [] = []
filterB p l = [x | x <- l, p x]

-- Trawersja drzewa
data Tree a b = Leaf a | Node a b (Tree a b) (Tree a b)
sampleTree = Node 'F' 'a' (Node 'B' 'x' (Leaf 'A') (Node 'D' 'x' (Leaf 'C') (Leaf 'E'))) (Node 'G' 'x' (Leaf 'I') (Leaf 'H'))

postfixTree (Leaf a) = []
postfixTree (Node a _ t1 t2) = postfixTree (t1) ++ postfixTree(t2) ++ [a]

prefixTree (Leaf a) = [a]
prefixTree (Node a _ t1 t2) = [a] ++ prefixTree(t1) ++ prefixTree(t2)

infixTree (Leaf a) = [a]
infixTree (Node a _ t1 t2) = infixTree (t1) ++ [a] ++ infixTree(t2)

-- takewhile rekurencyjnie
takewhile p [] = []
takewhile p (l:ls) = if p l then l:(takewhile p ls) else takewhile p []

-- takewhile z kombinatorem
ktakewhile p l = foldr (\x y -> if p x then x:y else []) [] l

ktakewhile2 p l = foldl (\x y -> if p y then y:x else []) [] l



-- 2015 b, zad 2 a
dropwhile p [] = []
dropwhile p (l:ls) = if p l then dropwhile p ls else l:ls


-------------------------
-- Kolokwium 2013
-------------------------
member x [] = False
member x l = foldl (\a b -> a || b == x) False l

flatten [] = []
flatten l = foldl (\a b -> a ++ b) [] l

-- rekurencyjnie
rsmaller_zero [] = []
rsmaller_zero (l:ls) = if l < 0 then l:(rsmaller_zero ls) else rsmaller_zero ls

-- koherencja
csmaller_zero l = [x | x <- l, x < 0]

-- kombinator
ksmaller_zero l = filter (<0) l

data Tree2 a = Leaf2 a | Node2 a (Tree2 a) (Tree2 a)

someTree = Node2 1 (Leaf2 2) (Leaf2 3)
someTree2 = Node2 [2,3,4] (Leaf2 [10,20,30]) (Leaf2 [5,4,2,3])

printTree2 (Leaf2 a) = [a]
printTree2 (Node2 a t1 t2) = (printTree2 t1) ++ [a] ++ (printTree2 t2)

times_5 :: Tree2 Int -> Tree2 Int -- tutaj Int jest wymuszony przez mnożenie
times_5 (Leaf2 a) = Leaf2 (5 * a)
times_5 (Node2 a t1 t2) = Node2 a (times_5 t1) (times_5 t2)

maptree :: (a -> a) -> Tree2 a -> Tree2 a
maptree f (Leaf2 a) = (Leaf2 (f a))
maptree f (Node2 a t1 t2)  = Node2 (f a) (maptree f t1) (maptree f t2)

remove2s :: Tree2 [Int] -> Tree2 [Int] -- typ wymuszony przez porównanie z 2
remove2s (Leaf2 a) = Leaf2 (filter (/=2) a)
remove2s (Node2 a t1 t2) = Node2 (filter (/=2) a) (remove2s t1) (remove2s t2)

----------------------------
-- Kolokwium 2014
----------------------------
-- zad 1
delete_all x l = filter (/=x) l

-- flatten jest wyżej

-- zad 2
rfilter2 p [] = []
rfilter2 p (l:ls) = if p l then l:(rfilter2 p ls) else (rfilter2 p ls)

cfilter2 p l = [x | x <- l, p x]

kfilter2 p l = foldl (\x y -> if p y then x ++ [y] else x) [] l
-- typ :: (a -> Boolean) -> [a] -> [a]

-- zad 3
data Tree3 a = Nil | Node3 a (Tree3 a) (Tree3 a)
anotherTree = Node3 1 (Node3 2 Nil Nil) (Node3 3 Nil Nil)
anotherTree2 = Node3 [1,2,3,4,5] (Node3 [2] Nil Nil) (Node3 [1,2,3] Nil Nil)

-- a
tree3size :: Tree3 a -> Int
tree3size Nil = 0
tree3size (Node3 a t1 t2) = 1 + tree3size t1 + tree3size t2

-- b
tree3compare x Nil = x
tree3compare x (Node3 a t1 t2) = if x > a then x else a

tree3max :: Tree3 Int -> Int
tree3max Nil = 0
tree3max (Node3 a t1 t2) = tree3compare (tree3compare a t1) t2
 
-- c
-- wypierdala się w GHC ale nie mam pojęcia jak to zrobić inaczej.
-- Pluje się, bo nie wie czy Nil należy do typu Tree a, bo nie ma a, więc
-- równie dobrze może należeć do Tree b
-- tree3map :: (a -> a) -> Tree3 a -> Tree3 a 
-- tree3map f Nil = Nil 
-- tree3map f (Node3 a t1 t2) = Node3 (f a) (tree3map t1) (tree3map t2)

-- d
tree3length :: Tree3 [a] -> [Int]
tree3length Nil = []
tree3length (Node3 a t1 t2) = (length a):(tree3length t1 ++ tree3length t2)