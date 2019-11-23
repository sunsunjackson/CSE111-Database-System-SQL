SELECT COUNT(DISTINCT C.c_name) FROM customer C, lineitem L, orders O
WHERE C.c_custkey = O.o_custkey AND L.l_orderkey = O.o_orderkey
AND L.l_discount >= 0.04;