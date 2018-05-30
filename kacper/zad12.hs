ffilter p [] = []
ffilter p (x:xs) = 
    if (p x) then x : (nfilter p xs)
    else nfilter p xs