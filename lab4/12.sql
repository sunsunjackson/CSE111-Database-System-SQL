SELECT R.r_name, MAX(S.s_acctbal)
FROM nation N, region R, supplier S
WHERE N.n_regionkey = R.r_regionkey AND S.s_nationkey = N.n_nationkey
GROUP BY R.r_name;