kwad a b c =
    if b*b - 4 * a * c > 0 then
        [(-b + sqrt(b*b - 4 * a * c ))/(2*a), (-b - sqrt(b*b - 4 * a * c ))/(2*a)]
    else if b*b - 4 * a * c == 0 then
        [-b/(2*a)] 
    else
        []