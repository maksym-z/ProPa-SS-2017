f []           = 0
f [a]          = a + f []
f [a,b]        = f [a] + f[b]
f (a:b:c:xs)   = b + f[a,c]

g []      = []
g (a:as)  = (\x -> x - a) : g as

h x y = (\y -> x) (\ x -> y)
