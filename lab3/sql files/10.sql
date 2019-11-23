SELECT SUM(O.o_totalprice) FROM orders O, customer C, nation N, region R
WHERE C.c_custkey = O.o_custkey AND N.n_regionkey = R.r_regionkey
AND C.c_nationkey = N.n_nationkey
AND R.r_name = 'EUROPE' AND O.o_orderdate LIKE '1996%';