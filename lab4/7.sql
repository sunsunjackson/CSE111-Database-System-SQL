SELECT N.n_name, O.o_orderstatus, COUNT(C.c_name)
FROM customer C, nation N, orders O, region R
WHERE C.c_nationkey = N.n_nationkey  AND C.c_custkey = O.o_custkey
AND R.r_regionkey = N.n_regionkey
AND R.r_name = 'ASIA'
GROUP BY N.n_name, O.o_orderstatus;