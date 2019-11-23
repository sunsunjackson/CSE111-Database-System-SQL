SELECT C.c_name, SUM(O.o_totalprice), N.n_name FROM customer C, nation N, orders O
WHERE C.c_custkey = O.o_custkey AND C.c_nationkey = N.n_nationkey
AND N.n_name = 'FRANCE'
GROUP BY C.c_name;