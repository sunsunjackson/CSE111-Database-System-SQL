SELECT R.r_name, S.s_name
FROM nation N, region R, supplier S
WHERE N.n_regionkey = R.r_regionkey AND S.s_nationkey = N.n_nationkey
GROUP BY R.r_name HAVING MAX(S.s_acctbal);