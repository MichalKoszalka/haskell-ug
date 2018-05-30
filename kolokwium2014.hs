--1a) delete all


--2b) using list comprehension
filter2 p l = [x | x <- l, p x]

--postfix
data Tree a b = Leaf a | Node a b (Tree a b) (Tree a b)
sampleTree = Node 10 'a' (Leaf 10) (Node 10 'b' (Node 10 'c' (Leaf 20) (Leaf 50)) (Leaf 100))
postTree (Leaf a) = [a]
postTree (Node a b t1 t2) =  (postTree t1) ++ (postTree t2) ++ [a]
--infix
inTree (Leaf a) = [a]
inTree (Node a b t1 t2) =  (inTree t1) ++ [a] ++ (inTree t2)
--prefix
preTree (Leaf a) = [a]
preTree (Node a b t1 t2) =  (preTree t1) ++ [a] ++ (preTree t2)

--3)
data Tree = Nil | Node a (Tree a) (Tree a)
--a) gęstość drzewa?

--b) maximum w drzewie
treeMax Nil x = x
treeMax Node a t1 t2 x = 