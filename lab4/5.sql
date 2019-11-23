SELECT C.c_name, COUNT(O.o_orderstatus) FROM customer C, nation N, orders O
WHERE C.c_custkey = O.o_custkey AND C.c_nationkey = N.n_nationkey
AND N.n_name = 'GERMANY' AND O.o_orderdate LIKE '1995%'
GROUP BY C.c_name;