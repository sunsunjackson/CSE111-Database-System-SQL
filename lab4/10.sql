SELECT P.p_type, MAX(L.l_discount)
FROM lineitem L, part P
WHERE L.l_partkey = P.p_partkey
AND P.p_type LIKE 'ECONOMY%'
GROUP BY P.p_type;