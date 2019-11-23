SELECT p_mfgr, Q5.o_orderpriority, COUNT(Q5.o_orderstatus)
FROM Q5, part, partsupp, lineitem
WHERE p_partkey = ps_partkey AND l_partkey = p_partkey
AND l_suppkey = ps_suppkey AND Q5.o_orderkey = l_orderkey
GROUP BY p_mfgr, Q5.o_orderpriority;