SELECT COUNT(C.c_name)
FROM customer C, nation N, region R
WHERE C.c_nationkey = N.n_nationkey AND N.n_regionkey = R.r_regionkey
AND NOT (R.r_name = 'AFRICA' OR R.r_name = 'EUROPE');