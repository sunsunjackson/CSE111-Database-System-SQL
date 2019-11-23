SELECT N.n_name, COUNT(DISTINCT C.c_name), COUNT(DISTINCT S.s_name)
FROM nation N, customer C, supplier S, region R
WHERE C.c_nationkey = N.n_nationkey AND N.n_regionkey = R.r_regionkey
AND C.c_nationkey = S.s_nationkey
AND R.r_name = 'EUROPE' GROUP BY N.n_name;