--najwiekszy wspolny dzielnik
gcd2 n 0 = n
gcd2 n m = gcd2 m (mod n m)
--najmniejsza wspolna wielokrotnosc
lcm2 x y = div (x*y) (gcd x y)
--delta rownania kwadratowego
delta a b c = (b*b) - (4*a*c)
--pierwiastek z delty(dla 3 przypadkow wartosci delty)
kwad a b c | delta a b c > 0 = [((-b -sqrt(delta a b c)) / 2*a), ((-b +sqrt(delta a b c))/ (2*a))]
kwad a b c | delta a b c == 0 = [ (-b) / (2*a)]
kwad a b c | delta a b c < 0 = []
--silnia
silnia1 0 = 1
silnia1 n = n * silnia1 (n-1)
--n-ty element ciagu fibonacciego, poza zerowym i pierwszym elementem, jest to suma dwoch poprzednich
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

