bigger a b = a > b

insertionsort bigger list = isort bigger list []

isort f [] s = s
isort f (l:ls) [] = isort f ls [l]
isort f (l:ls) (s:ss) =
    if f s l then  -- jeżeli element jest mniejszy niż pierwszy element z posortowanej listy
        isort f ls (l:s:ss)
    else 
        isort f ls (s:(isort f ss [l]))