SELECT N.n_name, COUNT(O.o_orderstatus) FROM nation N, orders O, region R, customer C
WHERE N.n_regionkey = R.r_regionkey AND C.c_custkey = O.o_custkey
AND C.c_nationkey = N.n_nationkey AND R.r_name = 'EUROPE'
GROUP BY N.n_name;