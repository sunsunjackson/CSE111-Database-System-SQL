SELECT AVG(C.c_acctbal) FROM customer C, nation N, region R
WHERE C.c_nationkey = N.n_nationkey AND N.n_regionkey = R.r_regionkey
AND R.r_name = 'EUROPE' AND C.c_mktsegment = 'MACHINERY';