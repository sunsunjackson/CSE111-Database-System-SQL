SELECT COUNT(DISTINCT S.s_name)
FROM part P, partsupp PS, supplier S
WHERE P.p_partkey = PS.p_spartkey AND S.s_suppkey = PS.p_ssuppkey
AND P.p_type LIKE '%MEDIUM POLISHED%'
AND (P.p_size = 3 OR P.p_size = 23 OR P.p_size = 26 OR P.p_size = 49);