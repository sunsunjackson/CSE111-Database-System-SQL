SELECT COUNT(O.o_orderpriority) FROM customer C, nation N, orders O
WHERE C.c_custkey = O.o_custkey AND C.c_nationkey = N.n_nationkey
AND O.o_orderpriority = '1-URGENT' AND N.n_name = 'BRAZIL' 
AND O.o_orderdate BETWEEN '1994%' AND '1997-31-12';