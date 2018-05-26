--dodawanie elementu do listy
append [] l = l
append (x : xs) l = x : (append xs l)
--czy element jest na liscie
member [] y = False
member (x : xs) y = if (x == y) then True else member xs y
--odwracanie listy
reverse1 [] = []
reverse1 (x : xs) = (reverse1 xs) ++ [x]
--ostatni elemnt listy
last1 [] = []
last1 [x] = [x]
last1 (x : xs) = last1 xs 
--usuwanie elementu z listy, jesli na niej jest
delete1 [] y = []
delete1 (x : xs) y = if (x == y) then xs else x : (delete1 xs y)
--filtrowanie listy za pomoca predykatu f
filter1 f [] = []
filter1 f (x : xs) = if(f x) then x : filter1 f xs else filter1 f xs
--podzial listy na dwie, jedna z elementami mniejszymi od x, a druga z wiekszymi
split1 [] x = [[],[]]
split1 (x : xs) y = [filter1 (\z -> z<y) (x : xs), filter1 (\z -> z>y) (x : xs)]
--podnosi kazdy element listy do kwadratu
quadrat1 [] = []
quadrat1 (x : xs) = (x*x) : quadrat1 xs
--laczy dwie listy
combine1 [] [] = []
combine1 (x: xs) (y: ys) = [x,y] : combine1 xs ys

--10 insertion sort ??

--map dla dwoch list ktory wykona dla kazdych dwoch elementow listy funkcje f, wynikiem jedna lista
map2 f [] [] = []
map2 f (x:xs) [] = (x:xs)
map2 f [] (x:xs) = (x:xs)
map2 f (x:xs) (y:ys) = (f x y) : (map2 f xs ys)

--zmienia dwie listy na liste par
pairing [] [] = []
pairing (x:xs) (y:ys) = (x,y) : pairing xs ys
--iloczyn skalarny - czyli suma iloczynow kolejnych elementow listy
skalar [] [] = 0
skalar (x:xs) (y:ys) = x*y + (skalar xs ys) 
--fold right, analogicznie do fold left tylko od pierwszego elementu, a nie jak foldl od ostatniego
foldr2 f z [] = z
foldr2 f z (x:xs) = foldl f z (reverse1 (x:xs))
--mnożenie elementow od lewej do prawej 
prod [] = 0
prod (x:xs) = foldl (*) 1 (x:xs)
--dlugosc listy przy pomocy fold
length1 [] = 0
length1 (x:xs) = foldl (\x y -> 1) 0 (x:xs)
--iloczyn dla wartosci boolowskich
and1 [] = False
and1 (x:xs) = foldl (&&) True (x:xs)
--najwiekszy wspolny dzielnik z wczesniej laboratoriow
gcd2 n 0 = n
gcd2 n m = gcd2 m (mod n m)
--najwiekszy wspolny dzielnik dla listy elementow przy pomocy fold
nwdFold [] = 0
nwdFold (x:xs) = foldl gcd2 x (xs)
--delete with fold
delete2 [] z = []
delete2 (x:xs) z = foldr (\a b -> if a==z then b else (a:b)) [] (x:xs)
--map with fold
map3 [] f = []
map3 (x:xs) f = foldr (\a b -> (f a):b) [] (x:xs)