data Tree a = Node a [Tree a]

treeOne = Node 10 []
treeOneHalf = Node 10 [Node 70 []]
treeTwo = Node 10 [Node 20 [], Node 30 [], Node 70 []]
treeThree = Node 10 [Node 20 [Node 40 []], Node 30 [Node 50 []]]

sizeTree (Node a []) = 1
sizeTree (Node a x) = 1 + (sum (map sizeTree x))