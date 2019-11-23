SELECT Q2.s_name, COUNT(p_name)
FROM Q2, part, partsupp
WHERE Q2.s_suppkey = partsupp.ps_suppkey AND part.p_partkey = partsupp.ps_partkey
AND part.p_size < 20 AND Q2.s_nation = 'BRAZIL'
GROUP BY Q2.s_name;