-- 1. a) (2) Prosz¦ zdeniowa¢ funkcj¦ member x l, która sprawdza, czy element x
-- jest w li±cie l.
member2 [] x = False
member2 (y:ys) x = if (y==x) then True else member2 ys x
-- b) (2) Prosz¦ napisa¢ funkcj¦ delete x l, która skasuje wszystkie wyst¡pienia
-- elementu x w li±cie l.
delete2 [] x = []
delete2 (y:ys) x = foldr(\a b -> if a == x then b else (a:b)) [] (y:ys)
-- c) (2) Prosz¦ napisa¢ funkcj¦ exists pred l dla jednoargumentowego predykatu
-- pred, której warto±¢ to False, je»eli wszystkie elementy x w li±cie l nie
-- speªniaj¡ predykat pred, a True w przeciwnym przepadku.
-- Uwaga: Nale»y u»ywa¢ odpowiedniego kombinatora!
exists2 pred [] = True
exists2 pred (x:xs) = foldr(\a b -> if(pred a) then True || b else False || b) False (x:xs)
-- 2. a) (2) Proszk¦ zdeniowa¢ funkcj¦ cut l, która skasuje pierwszy i ostatni element
-- z listy l. Je»eli l ma mniej ni» dwa elementy, warto±ci¡ ma by¢ pusta
-- lista.
-- Przykªad: > cut [4,3,2,0,1,2]
-- [3,2,0,1]
cutLast2 [] = []
cutLast2 [xs] = []
cutLast2 (x:xs) = x:(cutLast2 xs)
cut2 [] = []
cut2 [xs] = []
cut2 (x:y:[]) = []
cut2 (x:y:ys) = y:(cutLast2 ys)

-- b) (2) Prosz¦ zdeniowa¢ funkcj¦ palindrom l, która sprawdza, czy lista l
-- zawiera palindrom.
-- Przykªad: > palindrom [1,1,2,4,4,1]
-- False
-- > palindrom [1,2,3,2,1]
-- True
-- Uwaga: Mo»na u»ywa¢ funkcje reverse oraz last.
palindrom [] = True
palindrom [x] = True
palindrom (x:xs) = (x:xs) == (reverse(x:xs))
-- 3. Niech b¦dzie dany nast¦puj¡cy typ drzew.
-- data Tree a b = Leaf a | Node a b (Tree a b) (Tree a b)
data Tree a b = Leaf a | Node a b (Tree a b) (Tree a b)
-- a) (3) Prosz¦ zdeniowa¢ funkcj¦ sumTree t, która obliczy sum¦ elementów
-- typu a w drzewie t.
-- sumTree :: Tree a b -> Integer
-- sumTree :: Tree a -> Integer
sumTree (Leaf a) = 1
sumTree (Node a b) = (sumTree a) + (sumTree b)
-- b) (3) Prosz¦ zdeniowa¢ funkcj¦ preTree t, której warto±ci¡ jest lista elementów
-- drzewa t w porz¡dku preksowym.

-- c) (3) Prosz¦ zdeniowa¢ funkcj¦ mapb f t, która zastosuje funkcj¦ f do wszystkich
-- elementów typu b.

-- Nale»y te» podac typy zdeniowanych funkcji.
-- 4. a) (3) Prosz¦ obliczy¢ typ wyra»enia \f → fx.
-- b) (3) Prosz¦ obliczy¢ typ wyra»enia 2 ∗ (x + y).
-- Uwaga: Mo»na wykorzysta¢ 2 : Int, (+) : Int -> Int -> Int oraz
-- (*) : Int -> Int -> Int.