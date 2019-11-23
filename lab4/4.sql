SELECT S.s_name, COUNT(P.p_name) FROM nation N, part P, supplier S, partsupp SP
WHERE N.n_nationkey = S.s_nationkey AND SP.p_ssuppkey = S.s_suppkey
AND SP.p_spartkey = P.p_partkey AND P.p_size < 20 AND N.n_name = 'BRAZIL'
GROUP BY S.s_name;