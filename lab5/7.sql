SELECT o_orderpriority, COUNT(p_name)
FROM (SELECT * FROM
lineitem L, orders O, part P
WHERE L.l_orderkey = O.o_orderkey AND P.p_partkey = L.l_partkey
AND O.o_orderdate LIKE '1996%'
AND L.l_receiptdate < L.l_commitdate)
GROUP BY o_orderpriority;