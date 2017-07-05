lucky   = all (/=13)

unlucky1 = any (==13)
unlucky2 = not . lucky

catenate as []     = as
catenate as (b:bs) = b : (catenate as bs)

test_luck1 as bs = lucky as && lucky bs
test_luck2 as bs = lucky (catenate as bs)
