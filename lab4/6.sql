SELECT P.p_mfgr, O.o_orderpriority, COUNT(O.o_orderstatus)
FROM orders O, part P, partsupp PS, lineitem L
WHERE P.p_partkey = PS.p_spartkey AND L.l_partkey = P.p_partkey
AND L.l_suppkey = PS.p_ssuppkey AND O.o_orderkey = L.l_orderkey
GROUP BY P.p_mfgr,O.o_orderpriority;