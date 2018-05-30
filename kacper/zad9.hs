append [] m = m
append (l:ls) m = l:(append ls m)

member x [] = False
member x (l:ls) = x == l || member x ls

rev [] = []
rev (l:ls) = append (rev ls) [l]

mylast (l:[]) = l
mylast (l:ls) = mylast ls

delete x [] = []
delete x (l:ls) = if x == l then ls else append [l] (delete x ls)

split x l = asplit x l [[],[]]
asplit x [] [m,w] = [m, w]
asplit x (l:ls) [m, w] = 
    if x > l then asplit x ls [l:m, w] 
    else if x < l then asplit x ls [m, l:w]
    else asplit x ls [m, w]

quadrat [] = []
quadrat (l:ls) = (l*l):quadrat ls

combine [] [] = []
combine (l:ls) (m:ms) = [l,m]:(combine ls ms)