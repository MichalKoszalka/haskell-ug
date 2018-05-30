data BinTree a = Leaf a | Node (BinTree a) (BinTree a)
bin = Node (Node (Leaf 10) (Leaf 200)) (Node(Leaf 30) (Leaf 40))

heightBinTree :: BinTree a -> Integer
heightBinTree (Leaf a) = 1
heightBinTree (Node a b) = 1 + (max (heightBinTree a) (heightBinTree b))

sizeBinTree (Leaf a) = 1
sizeBinTree (Node a b) = 1 + (sizeBinTree a) + (sizeBinTree b)

maxBinTree (Leaf a) = a
maxBinTree (Node a b) = max (maxBinTree a) (maxBinTree b)

preBinTree (Leaf a) = [a]
preBinTree (Node a b) = (preBinTree a) ++ (preBinTree b)


--- mapBinTree - napisać
--- foldBinTree - napisać
--- obu użyć do powyższych fcji