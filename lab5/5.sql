SELECT S.s_name, P.p_size, MIN(PS.p_ssupplycost)
FROM nation N, part P, partsupp PS, region R, supplier S
WHERE N.n_regionkey = R.r_regionkey AND S.s_nationkey = N.n_nationkey
AND P.p_partkey = PS.p_spartkey AND PS.p_ssuppkey = S.s_suppkey
AND P.p_type LIKE '%STEEL%' AND R.r_name = 'AMERICA'
GROUP BY P.p_size
ORDER BY S.s_name ASC;