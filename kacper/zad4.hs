fodd 0 = False
fodd n = feven (n-1)

feven 0 = True
feven n = fodd (n-1)