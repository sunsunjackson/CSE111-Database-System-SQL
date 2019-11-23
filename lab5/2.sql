SELECT R.r_name, COUNT(S.s_name)
FROM nation N, region R, supplier S, (SELECT r_name, AVG(S.s_acctbal) as avg_bal FROM supplier S, nation N, region R 
where S.s_nationkey = N.n_nationkey and N.n_regionkey = R.r_regionkey
GROUP BY R.r_name) T
WHERE R.r_regionkey = N.n_regionkey AND S.s_nationkey = N.n_nationkey
and T.r_name = R.r_name
AND S.s_acctbal > T.avg_bal
GROUP BY R.r_name;